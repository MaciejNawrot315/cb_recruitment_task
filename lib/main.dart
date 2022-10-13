import 'package:code_borthers_recruitment_task/cubits/comments/comments_cubit.dart';
import 'package:code_borthers_recruitment_task/cubits/photos/photos_cubit.dart';
import 'package:code_borthers_recruitment_task/services/network_services/network_service.dart';
import 'package:code_borthers_recruitment_task/ui/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  runApp(const MyApp());
}

NetworkService networkService = NetworkService();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PhotosCubit>(
          create: (BuildContext context) => PhotosCubit(),
        ),
        BlocProvider<CommentsCubit>(
          create: (BuildContext context) => CommentsCubit(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),
    );
  }
}
