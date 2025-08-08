import 'package:flutter/material.dart';

List<DateTime> generateDatesGrid(DateTime month) {

  int numDaysOfMonth = DateTime(month.year, month.month + 1, 0).day;
  int firstWeekday = DateTime(month.year, month.month, 1).weekday % 7;

  // Fill previous month's dates
  DateTime previousMonth = DateTime(month.year, month.month - 1);
  int previousMonthLastDay = DateTime(previousMonth.year, previousMonth.month + 1, 0).day;

  List<DateTime> dates = [];

  for (int i = firstWeekday; i > 0; i--) {
    dates.add(DateTime(previousMonth.year, previousMonth.month,
        previousMonthLastDay - i + 1));
  }

  // Fill current month's dates
  for (int day = 1; day <= numDaysOfMonth; day++) {
    dates.add(DateTime(month.year, month.month, day));
  }

  // Fill next month's dates
  int remainingBoxes = 42 - dates.length; // 6 weeks * 7 days
  for (int day = 1; day <= remainingBoxes; day++) {
    dates.add(DateTime(month.year, month.month + 1, day));
  }

  return dates;
}

List<String> getStatusCalendar(List<DateTime> listMonth, DateTime today) {

  List<String> disableDay = [];
  bool firstDayFounded = false;

  for (int i = 0; i < listMonth.length; i++) {
    if (listMonth[i].day == 1 && firstDayFounded == false) {
      firstDayFounded = true;
      disableDay.add('available');
    } else if (listMonth[i].day != 1 && firstDayFounded == true) {
      disableDay.add('available');
    } else if (listMonth[i].day == 1 && firstDayFounded == true) {
      firstDayFounded = false;
      disableDay.add('disable');
    } else {
      disableDay.add('disable');
    }
  }
  return disableDay;
}

Color getCalendaBoxColr(context, String status) {

  if (status == 'available') {
    return Theme.of(context).colorScheme.secondary;
  } else if (status == 'selected') {
    return Theme.of(context).colorScheme.onSecondaryContainer;
  } else if (status == 'marked') {
    return Theme.of(context).colorScheme.secondary;
  } else if (status == '2marked') {
    return Theme.of(context).colorScheme.secondary;
  } else if (status == '3marked') {
    return Theme.of(context).colorScheme.secondary;
  } else if (status == 'disable') {
    return Colors.transparent;
  } else {
    return Theme.of(context).colorScheme.onSecondaryContainer;
  }
}

String changeStatus(status) {
  switch (status) {
    case "available" : {
      return "selected";
    }
    case "selected" : {
      return "available";
    }
    case "marked" : {
      return "marked-selected";
    }
    case "marked-selected" : {
      return "marked";
    }
    case "2marked" : {
      return "2marked-selected";
    }
    case "2marked-selected" : {
      return "2marked";
    }
    case "3marked" : {
      return "3marked-selected";
    }
    case "3marked-selected" : {
      return "3marked";
    }
    default : {
      return status;
    }

  }
  
}