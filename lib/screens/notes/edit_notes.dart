import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesapp/controller/appController.dart';
import 'package:notesapp/firebase/functions.dart';
import 'package:notesapp/widgets/button.dart';
import 'package:notesapp/widgets/text.dart';

class EditNotes extends StatelessWidget {
  const EditNotes({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final appController = Get.put(AppController());
    var arg = Get.arguments;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0.0,
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                removeCurrentViewer(
                    id: arg, userName: appController.userName.text);
                Get.back();
              },
              icon: const Icon(Icons.arrow_back)),
          title: text(
            title: 'Edit Notes',
            color: Colors.black,
            fontSize: width * 0.08,
            fontWeight: FontWeight.w700,
          ),
        ),
        body: SizedBox(
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: width * 0.03),
                  child: Row(
                    children: [
                      const Icon(Icons.remove_red_eye_outlined),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      text(
                          title: "Live on Note",
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,),
                    ],
                  )),
              StreamBuilder(
                  stream: getCurrentViewer(id: arg),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Row(
                        children: List.generate(
                          snapshot.data.data()['currentViewers'].length,
                          (index) {
                            return Container(
                              margin: EdgeInsets.only(
                                left: width * 0.02,
                              ),
                              child: Chip(
                                label: text(
                                  title: snapshot.data.data()['currentViewers']
                                      [index],
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                                backgroundColor: Colors.black,
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
              SizedBox(
                height: height * 0.2,
              ),
              Container(
                alignment: Alignment.center,
                width: width,
                padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                child: TextFormField(
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  controller: appController.editNote,
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
                  title: 'Update',
                  onPressed: () {
                    appController.editNotefunction(
                        id: arg, note: appController.editNote.text);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
