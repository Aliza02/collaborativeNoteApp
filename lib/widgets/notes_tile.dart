import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:notesapp/Utils/utils.dart';
import 'package:notesapp/controller/appController.dart';
import 'package:notesapp/firebase/functions.dart';
import 'package:notesapp/routes/routes.dart';
import 'package:notesapp/widgets/text.dart';

class NoteTile extends StatefulWidget {
  final String notes;
  final String id;

  const NoteTile({
    super.key,
    required this.notes,
    required this.id,
  });

  @override
  State<NoteTile> createState() => _NoteTileState();
}

class _NoteTileState extends State<NoteTile> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final appController = Get.put(AppController());
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: List.generate(
          2,
          (index) => Expanded(
            child: InkWell(
              onTap: () {
                if (index == 0) {
                  appController.gotoEdits(id: widget.id);
                  appController.editNote.text = widget.notes;
                } else {
                  deleteANote(id: widget.id);
                  Utils.showSnackBar("Your note has been deleted");
                }
              },
              child: Container(
                width: Get.width * 0.24,
                height: Get.height * 0.09,
                margin: EdgeInsets.only(
                  right: Get.width * 0.02,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.01,
                ),
                decoration: BoxDecoration(
                  color: [Color(0xFF21B7CA), Colors.red[300]][index],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    text(
                      title: ['Edit', 'Delete'][index],
                      fontSize: Get.width * 0.04,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    Icon(
                      [Icons.edit, Icons.delete][index],
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: Get.height * 0.01,
          horizontal: Get.width * 0.05,
        ),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        child: ListTile(
          title: text(
            title: widget.notes,
            fontSize: width * 0.04,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          trailing: IconButton(
            onPressed: () {
              Get.toNamed(
                AppRoutes.comments,
                arguments: widget.id,
              );
            },
            icon: const Icon(Icons.chat_bubble_outline),
          ),
        ),
      ),
    );
  }
}
