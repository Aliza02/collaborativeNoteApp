import 'package:flutter/material.dart';
import 'package:notesapp/widgets/text.dart';

class button extends StatelessWidget {
  final String title;
  final Function onPressed;
  const button({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ElevatedButton.styleFrom(
          elevation: 0.0,
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
            width * 0.03,
          ))),
      child: text(
        title: title,
        color: Colors.white,
        fontSize: width * 0.04,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
