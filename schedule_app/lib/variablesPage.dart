import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'functions.dart';

class MainProvider extends ChangeNotifier {
  //// Pass global variables here !!!

  final List<DateTime> currentDateGrid = generateDatesGrid(DateTime.now());
  final DateTime todayy = DateTime.now();

  void updateGrid() {
    if ( currentDateGrid != generateDatesGrid(DateTime.now()) ) {
      notifyListeners();
    }
  }
}

List<IconData> mainNavIcons = [
  Icons.home_filled,
  Icons.travel_explore_outlined,
  Icons.face_retouching_natural,
];

Map<int, String> monthMapper = {
  1: 'January',
  2: 'February',
  3: 'March',
  4: 'April',
  5: 'May',
  6: 'June',
  7: 'July',
  8: 'August',
  9: 'September',
  10: 'October',
  11: 'November',
  12: 'December',
};

Map<int, String> weekMapper = {
  0: 'Sunday',
  1: 'Monday',
  2: 'Tuesday',
  3: 'Wednesday',
  4: 'Thursday',
  5: 'Friday',
  6: 'Saturday',
};