
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_chart/home_view_model.dart';
import 'package:syncfusion_chart/splash_screen.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


import 'dart:async';
import 'package:flutter/material.dart';

import 'home_view.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) => MultiProvider(
                  providers: [
                    ChangeNotifierProvider(
                      create: (_) => HomeViewModel(),
                    )],
                  child: const HomeView(),
             )
        )
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child:Center(child: const Text('splash'))
    );
  }
}
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//   late String _emailAddress, _password;
//
//
//
//   @override
//   void initState() {
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     const appTitle = 'Syncfusion Chart';
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: const DoughnutChartUI(),
//       ),
//     );
//   }
// }





