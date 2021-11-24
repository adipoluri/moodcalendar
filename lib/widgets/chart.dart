import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:moodcalendar/util/constants.dart';
import '../model/year.dart';
import 'dart:math' as math;

const cellRed = Color(0xffc73232);
const cellMustard = Color(0xffd7aa22);
const cellGrey = Color(0xffcfd4e0);
const cellBlue = Color(0xff1553be);
const background = Color(0xff242830);

class Chart extends StatefulWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: dark1,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: dark2,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: LayoutGrid(
          gridFit: GridFit.expand,
          columnSizes: repeat(12, [1.fr]),
          rowSizes: repeat(32, [1.fr]),
          columnGap: 10,
          rowGap: 6,
          children: [
            for (int x = 0; x < 12; x++)
              for (int y = 0; y < 32; y++)
                getDayWidget(x, y)
                    .withGridPlacement(columnStart: x, rowStart: y),
          ],
        ),
      ),
    );
  }

  Widget getDayWidget(int month, int day) {
    if (day == 0) {
      return monthButton(month);
    } else if (day <= Year.months[month].days) {
      return dayButton(day);
    } else {
      return Container(
        color: Colors.white10.withAlpha(0),
      );
    }
  }

  ElevatedButton dayButton(int day) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        onSurface: const Color(0x1AFFFFFF), // background
        onPrimary: const Color(0xFFB6A26A),
        primary: getRandomColor(),
        elevation: 8,
        // foreground
      ),
      child: Center(
          child: Text(
            day.toString(),
            style: const TextStyle(
              color: dark0,
              fontSize: 8,
              fontFamily: 'Nerd',
              fontWeight: FontWeight.bold,
              letterSpacing: 0,
            ),
          ),
      ),
    );
  }

  ElevatedButton monthButton(int month) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        onSurface: const Color(0x1AFFFFFF), // background
        onPrimary: const Color(0xFFB6A26A),
        primary: dark3,
        elevation: 8,
        // foreground
      ),
      child: Center(
          child: Text(
            Year.months[month].name[0],
            style: const TextStyle(
              color: light2,
              fontSize: 15,
              fontFamily: 'Nerd',
              fontWeight: FontWeight.bold,
              letterSpacing: 3,
            ),
          ),
      ),
    );
  }
}
