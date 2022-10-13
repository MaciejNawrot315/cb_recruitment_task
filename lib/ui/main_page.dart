import 'package:code_borthers_recruitment_task/cubits/photos/photos_cubit.dart';
import 'package:code_borthers_recruitment_task/ui/comments_page.dart';
import 'package:code_borthers_recruitment_task/ui/photos_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<PhotosCubit>().loadPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) => setState(() {
          currentIndex = value;
        }),
        items: const [
          BottomNavigationBarItem(
            label: "Photos",
            icon: Icon(Icons.photo),
          ),
          BottomNavigationBarItem(
            label: "Comments",
            icon: Icon(Icons.comment),
          )
        ],
      ),
      body: currentIndex == 0 ? const PhotosPage() : const CommentsPage(),
    );
  }
}
