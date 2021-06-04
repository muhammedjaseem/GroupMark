import 'dart:async';

import 'package:flutter/material.dart';

import 'package:markgroup/view/Login_page.dart';


class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => loginpage()));
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding:
          const EdgeInsets.all(10),
          child: Container(
            height: 600,
            child: Image.asset("images/splash.png",height: 600,width: 400,),
          ),
        ),
      ),
    );
  }
}
