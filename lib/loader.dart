import 'package:flutter/material.dart';

class Loader{
  static final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  static get key => _navigatorKey;
  static List<bool> statusList = [];
  void showLoadingPopup() {
    statusList.add(true);
    Loader.key.currentState?.push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) => LoadingPopup(),
      ),
    );
  }

  void hideLoadingPopup() {
    if(statusList.isNotEmpty){
      statusList.removeAt(0);
      Loader.key.currentState?.pop();
    }
  }
}

class LoadingPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: const Stack(
        children: [
          Opacity(
            opacity: 0.5,
            child: ModalBarrier(dismissible: false, color: Colors.black),
          ),
          Center(
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
