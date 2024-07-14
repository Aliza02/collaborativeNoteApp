import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesapp/Utils/utils.dart';
import 'package:notesapp/controller/appController.dart';
import 'package:notesapp/firebase/functions.dart';
import 'package:notesapp/widgets/text.dart';

class Comments extends StatelessWidget {
  const Comments({super.key});

  @override
  Widget build(BuildContext context) {
    String id = Get.arguments;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    TextEditingController commentController = TextEditingController();
    final appController = Get.put(AppController());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0.0,
          title: text(
            title: 'Comments',
            color: Colors.black,
            fontSize: width * 0.06,
            fontWeight: FontWeight.w700,
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.03,
                ),
                TextFormField(
                  controller: commentController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        if (commentController.text.isNotEmpty) {
                          saveComments(
                              id: id,
                              comment: commentController.text,
                              userName: appController.userName.text);
                          Utils.showSnackBar("Comment has been posted");
                          commentController.clear();
                        } else {
                          Utils.showSnackBar("please write something..");
                        }
                      },
                      icon: const Icon(Icons.send),
                    ),
                    hintText: "Write a Comment",
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        width * 0.04,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: height * 0.02,
                  ),
                  child: text(
                    title: "All Comments",
                    fontSize: width * 0.05,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                StreamBuilder(
                  stream: getComments(id: id),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData ||
                        snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasData) {
                      if (snapshot.data!.docs.isEmpty) {
                        return Center(
                          child: text(
                            title: "No Comments to display",
                            fontSize: width * 0.045,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        );
                      } else {
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot doc = snapshot.data!.docs[index];
                            return Container(
                              margin: EdgeInsets.symmetric(
                                vertical: height * 0.01,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(
                                  width * 0.02,
                                ),
                              ),
                              child: ListTile(
                                title: text(
                                  title: doc['author'],
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                ),
                                subtitle: text(
                                  title: doc['comment'],
                                  fontSize: width * 0.045,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            );
                          },
                        );
                      }
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
