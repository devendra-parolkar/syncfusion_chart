import 'dart:async';

import 'package:flutter/material.dart';
import 'package:syncfusion_chart/home_view_model.dart';

import 'home_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Timer? _timer;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _startTimer(context);
  }

  _startTimer(BuildContext context) async {
    _timer = Timer(const Duration(seconds: 30), () async {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder:
              (context) => const HomeView()
          )
      );
    });
  }
}