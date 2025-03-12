class MonthData {
  static List<String> month = [
    "January",
    "February"
        "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];
  static List<DateTime> getWeekDates(DateTime selectedDate) {
    DateTime startDate = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day - 2,
    );
    return List.generate(6, (index) => startDate.add(Duration(days: index)));
  }
}
