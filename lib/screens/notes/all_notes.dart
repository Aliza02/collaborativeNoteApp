import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:notesapp/Utils/utils.dart';
import 'package:notesapp/bloc/internet_bloc.dart';
import 'package:notesapp/bloc/internet_states.dart';
import 'package:notesapp/controller/appController.dart';
import 'package:notesapp/firebase/functions.dart';
import 'package:notesapp/routes/routes.dart';
import 'package:notesapp/widgets/notes_tile.dart';
import 'package:notesapp/widgets/text.dart';

class AllNotes extends StatefulWidget {
  const AllNotes({super.key});

  @override
  State<AllNotes> createState() => _AllNotesState();
}

class _AllNotesState extends State<AllNotes> {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  final appController = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: BlocListener<InternetBloc, InternetState>(
        listener: (context, state) {
          if (state is InternetConnectedState) {
            print(state);
            print('connected');
            Utils.showSnackBar("You are Connected to Internet");
          } else if (state is InternetLostState) {
            print('disconnected');
            print(state);
            Utils.showSnackBar(
                "you are offline. Connect to internet to reflect changes.");
          } else {
            print(state);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
            scrolledUnderElevation: 0.0,
            title: text(
              title: 'All Notes',
              color: Colors.black,
              fontSize: width * 0.08,
              fontWeight: FontWeight.w700,
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Get.back();
                  appController.userName.clear();
                },
                icon: Icon(
                  Icons.logout,
                  size: width * 0.08,
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05,
                  vertical: height * 0.02,
                ),
                child: text(
                  title: "Hi ${appController.userName.text} Welcome,",
                  fontSize: width * 0.057,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
              Expanded(
                child: StreamBuilder(
                    stream: getAllNotes(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        print(snapshot.data!.docs.length);

                        return snapshot.data.docs.isNotEmpty &&
                                snapshot.connectionState ==
                                    ConnectionState.active
                            ? ListView.builder(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context, index) {
                                  DocumentSnapshot snap =
                                      snapshot.data!.docs[index];

                                  return NoteTile(
                                    notes: snap['note'],
                                    id: snap.id,
                                  );
                                },
                              )
                            : SizedBox(
                                height: Get.height * 0.1,
                                child: Center(
                                  child: text(
                                    title: 'No Note to display',
                                    color: Colors.grey,
                                    fontSize: width * 0.05,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: () {
              Get.toNamed(AppRoutes.addNotes);
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
