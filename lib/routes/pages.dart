import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:notesapp/bloc/internet_bloc.dart';
import 'package:notesapp/routes/routes.dart';
import 'package:notesapp/screens/comments/commetns.dart';
import 'package:notesapp/screens/login/login.dart';
import 'package:notesapp/screens/notes/all_notes.dart';
import 'package:notesapp/screens/notes/add_notess.dart';
import 'package:notesapp/screens/notes/edit_notes.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart'
    as GetTrasition;

class Pages {
  static List<GetPage<dynamic>> pages = [
    GetPage(
      name: AppRoutes.login,
      page: () => const signin(),
      transition: GetTrasition.Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.allNotes,
      page: () => BlocProvider(
            create: (context) => InternetBloc(),
            child: const AllNotes(),
          ),
      
    
       transition: GetTrasition.Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.addNotes,
      page: () => const addNotes(),
      transition: GetTrasition.Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.editNote,
      page: () => const EditNotes(),
       transition: GetTrasition.Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.comments,
      page: () => const Comments(),
       transition: GetTrasition.Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 500),
    ),
  ];
}
