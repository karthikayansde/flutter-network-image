import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'loader.dart';
import 'nextPage.dart';
void main (){
  return runApp(MaterialApp(
    navigatorKey: Loader.key,
    home: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 50,
              itemBuilder: (context, index) =>
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: CircleAvatar(
                        radius: 32.0,
                        backgroundColor: Colors
                            .transparent,
                        child: ClipRRect(
                          borderRadius:
                          BorderRadius.circular(32),
                          child: networkImageCommon(
                              index%2 == 0?"https://t3.ftcdn.net/jpg/03/51/15/08/360_F_351150802_VAlf5qCG8jhHdMG75g2EoqHBwV0CSfSo.jpg":"https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_640.jpg",
                              500,
                              width: 500,
                              height: 500,
                              false),
                        )
                    ),
                  ),),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 130, child: ElevatedButton(onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PageSecond()),
                );
              }, child: Text("download"))),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Buttons(),
        ],
      ),
    );
  }
}

Widget networkImageCommon(String image, double placeHeight, bool isSlider,
    {double? height, double? width, BoxFit? boxFit}) {
  // return SizedBox(height: 100, width: 100, child: Image.network(image));
    return SizedBox(
      height: 400,
      width: 400,
      child: FadeInImage(
      fadeInDuration: const Duration(milliseconds: 150),
      image: NetworkImage(image),
      height: height ?? height,
      width: width ?? width,
      fit: boxFit ?? BoxFit.cover,
      placeholder: sliderPlaceHolder(),
      placeholderErrorBuilder: ((context, error, stackTrace) {
        return erroWidget(placeHeight);
      }),
      imageErrorBuilder: ((context, error, stackTrace) {
        return erroWidget(placeHeight);
      }),
        ),
    );
}
sliderPlaceHolder() {
  return const AssetImage(
    "assets/images/teapioca.png",
  );
}

erroWidget(double size) {
  return Image.asset(
    "assets/images/teapioca.png",
    width: size,
    height: size,
  );
}

class PageSecond extends StatefulWidget {
  const PageSecond({super.key});

  @override
  State<PageSecond> createState() => _PageSecondState();
}

class _PageSecondState extends State<PageSecond> {
  bool val = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Buttons(),
          Expanded(
            child: Container(
              color: Colors.red,
              width: 100,
            ),
          )
        ],
      ),
    );
  }
}
