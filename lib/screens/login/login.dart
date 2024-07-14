import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:notesapp/controller/appController.dart';
import 'package:notesapp/res/images.dart';
import 'package:notesapp/widgets/text.dart';

class signin extends StatelessWidget {
  const signin({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final appController = Get.put(AppController());
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.06,
          ),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.1,
              ),
              SizedBox(
                height: height * 0.5,
                child: Image.asset(AppImages.signing),
              ),
              TextFormField(
                controller: appController.userName,
                decoration: InputDecoration(
                    hintText: 'Enter User name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(width * 0.04),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ))),
              ),
              Container(
                width: width * 0.4,
                margin: EdgeInsets.symmetric(
                  vertical: height * 0.01,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    appController.gotoMainPage();
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      backgroundColor: Colors.blue[400],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                        width * 0.03,
                      ))),
                  child: text(
                    title: 'Sign in',
                    color: Colors.black,
                    fontSize: width * 0.04,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
