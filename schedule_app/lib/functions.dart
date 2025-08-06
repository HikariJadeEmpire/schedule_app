

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