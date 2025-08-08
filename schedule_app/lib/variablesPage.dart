import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'functions.dart';

class MainProvider extends ChangeNotifier {
  //// Pass global variables here !!!

  final DateTime todayy = DateTime.now();

  late List<DateTime> currentDateGrid = generateDatesGrid(DateTime.now());
  late List<String> dayStatus = getStatusCalendar(currentDateGrid, todayy);
  late DateTime selectedDate;

  void updateGrid() {
    if ( currentDateGrid != generateDatesGrid(DateTime.now()) ) {

      // TODO: Make change when users change the month

      currentDateGrid = generateDatesGrid(selectedDate);
      dayStatus = getStatusCalendar(currentDateGrid, selectedDate);
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