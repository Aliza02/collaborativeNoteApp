import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesapp/controller/appController.dart';
import 'package:notesapp/widgets/button.dart';
import 'package:notesapp/widgets/text.dart';

class addNotes extends StatelessWidget {
  const addNotes({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final appController = Get.put(AppController());

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0.0,
        title: text(
          title: 'Add Notes',
          color: Colors.black,
          fontSize: width * 0.08,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: SizedBox(
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: width,
              padding: EdgeInsets.symmetric(horizontal: width * 0.1),
              child: TextFormField(
                maxLines: null,
                keyboardType: TextInputType.multiline,
                controller: appController.addNote,
                textAlign: TextAlign.center,
                // cursorColor: AppColors.bluegrey,
                cursorHeight: 40.0,
                textAlignVertical: TextAlignVertical.center,
                style: TextStyle(
                  fontSize: width * 0.08,
                  decoration: TextDecoration.none,
                  // color: AppColors.bluegrey,
                ),
                decoration: InputDecoration(
                  hintText: 'Write a Note',
                  hintStyle: TextStyle(
                    fontSize: width * 0.08,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              width: width * 0.6,
              margin: EdgeInsets.symmetric(
                vertical: height * 0.01,
              ),
              child: button(
                title: 'Add',
                onPressed: () {
                  appController.addNotefunction();
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}
