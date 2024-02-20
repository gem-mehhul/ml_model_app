import 'package:flutter/material.dart';
import 'package:ml_model_app/features/home/Dashboard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        extendBodyBehindAppBar: true,
        // backgroundColor: Colors.amberAccent,
        body: Dashboard());
  }
}
