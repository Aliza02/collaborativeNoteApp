import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesapp/Utils/utils.dart';
import 'package:notesapp/firebase/functions.dart';
import 'package:notesapp/routes/routes.dart';

class AppController extends GetxController {
  TextEditingController userName = TextEditingController();
  TextEditingController addNote = TextEditingController();
  TextEditingController editNote = TextEditingController();
  List currentViewers = [].obs;

  bool gotoMainPage() {
    if (userName.text.isNotEmpty) {
      Get.toNamed(AppRoutes.allNotes);
      return true;
    } else {
      Utils.showSnackBar("Please Enter User Name");
      return false;
    }
  }

  bool addNotefunction() {
    if (addNote.text.isNotEmpty) {
      addNoteToDatabase(note: addNote.text);
      Utils.showSnackBar("Your Note has been added");
      addNote.clear();
      Get.toNamed(AppRoutes.allNotes);
      return true;
    } else {
      Utils.showSnackBar("Write a note please");
      return false;
    }
  }

  bool editNotefunction({required String id, required String note}) {
    if (editNote.text.isNotEmpty) {
      eidtANote(id: id, updatedNote: note);
      Utils.showSnackBar('Note has been Edited');
      removeCurrentViewer(id: id, userName: userName.text);
      Get.toNamed(AppRoutes.allNotes);
      return true;
    } else {
      Utils.showSnackBar("please write something");
      return false;
    }
  }

  bool gotoEdits({required String id}) {
    Get.toNamed(AppRoutes.editNote, arguments: id);
    saveCurrentViewer(id: id, userName: userName.text);
    return true;
  }
}
