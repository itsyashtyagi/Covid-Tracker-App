import 'dart:async';

import 'package:covid_tracker_app/Screens/world_stats.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _animation =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    super.dispose();
    _animation.dispose();
  }

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 5), () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => WorldStatsScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedBuilder(
              animation: _animation,
              child: Container(
                height: 250,
                width: 250,
                child: const Center(
                  child: Image(image: AssetImage('assets/virus.png')),
                ),
              ),
              builder: (BuildContext context, Widget? child) {
                return Transform.rotate(
                  angle: _animation.value * 2.0 * math.pi,
                  child: child,
                );
              }),
          SizedBox(
            height: MediaQuery.of(context).size.height * .08,
          ),
          const Align(
            alignment: Alignment.center,
            child: Text(
              'Covid \n Tracker App',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
        ],
      )),
    );
  }
}
