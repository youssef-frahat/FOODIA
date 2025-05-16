import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class DottedLineRedWidget extends StatelessWidget {
  const DottedLineRedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DottedLine(dashColor: Colors.red, lineThickness: 1),
    );
  }
}
