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
                          child: NetworkImageCommon(
                            URL: index%2 == 0?"https://t3.ftcdn.net/jpg/03/51/15/08/360_F_351150802_VAlf5qCG8jhHdMG75g2EoqHBwV0CSfSo.jpg":"https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_640.jpg",
                              defaultImage: "assets/images/teapioca.png",
                              width: 500,
                              height: 500,
                              ),
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

class NetworkImageCommon extends StatelessWidget {
  final double height;
  final double width;
  final String URL;
  final BoxFit? fit;
  final String defaultImage;
  const NetworkImageCommon({super.key, required this.height, required this.width, required this.URL, this.fit, required this.defaultImage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: FadeInImage(
        fadeInDuration: const Duration(milliseconds: 150),
        image: NetworkImage(URL),
        fit: fit,
        placeholder: sliderPlaceHolder(defaultImage),
        placeholderErrorBuilder: ((context, error, stackTrace) {
          return errorWidget(defaultImage);
        }),
        imageErrorBuilder: ((context, error, stackTrace) {
          return errorWidget(defaultImage);
        }),
      ),
    );
  }

  sliderPlaceHolder(String defaultImage) {
    return AssetImage(
      defaultImage,
    );
  }

  errorWidget(String defaultImage) {
    return Image.asset(
      defaultImage,
    );
  }

}
