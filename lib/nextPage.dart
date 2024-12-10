import 'package:flutter/material.dart';

import 'loader.dart';
import 'main.dart';

class Buttons extends StatefulWidget {
  const Buttons({super.key});

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          Loader().showLoadingPopup();
          Loader().showLoadingPopup();
          await Future.delayed(Duration(seconds: 3));
          Loader().hideLoadingPopup();
          Loader().showLoadingPopup();
          Loader().hideLoadingPopup();
          Loader().hideLoadingPopup();
        },
        child: Text("Show Loading Popup"),
      );
  }
}
