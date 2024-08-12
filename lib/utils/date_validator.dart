class DateValidator {
  DateValidator({required this.dueDateString});
  final String dueDateString;

  bool hasDatePassed() {
    final dueDate = DateTime.parse(dueDateString);

    final currentDate = DateTime.now();

    final dueDateWithoutTime =
        DateTime(dueDate.year, dueDate.month, dueDate.day);
    final currentDateWithoutTime =
        DateTime(currentDate.year, currentDate.month, currentDate.day);

    return dueDateWithoutTime.isBefore(currentDateWithoutTime);
  }
}
