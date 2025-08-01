import 'package:flutter/material.dart';
import 'SummaryPage.dart';

class MyHomepage extends StatefulWidget {
  const MyHomepage({super.key});

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {

  late int tempVar;

  @override
  void initState() {
    super.initState();

    tempVar = 2;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Theme.of(context).colorScheme.primary,
      drawerScrimColor: Theme.of(context).colorScheme.onPrimary,
      
      body: SummaryPages(),

      bottomNavigationBar: Container(
        height: 100,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        ),
    );
  }
}