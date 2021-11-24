import 'month.dart';

class Year {
  static final List<Month> months = [
    const Month(
      name: "January",
      days: 31
    ),
    const Month(
      name: "February",
      days: 29
    ),
    const Month(
      name: "March",
      days: 31
    ),
    const Month(
      name: "April",
      days: 30
    ),
    const Month(
      name: "May",
      days: 31
    ),
    const Month(
      name: "June",
      days: 30
    ),
    const Month(
      name: "July",
      days: 31
    ),
    const Month(
      name: "August",
      days: 31
    ),
    const Month(
      name: "September",
      days: 30
    ),
    const Month(
      name: "October",
      days: 31
    ),
    const Month(
      name: "November",
      days: 30
    ),
    const Month(
      name: "December",
      days: 31
    ),
  ];

  static Month getMonthByName(name) {
    return months.where((p) => p.name == name).first;
  }

}