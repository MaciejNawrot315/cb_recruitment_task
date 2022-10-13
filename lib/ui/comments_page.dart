import 'package:code_borthers_recruitment_task/cubits/comments/comments_cubit.dart';
import 'package:code_borthers_recruitment_task/models/comment.dart';
import 'package:code_borthers_recruitment_task/ui/error_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class CommentsPage extends StatelessWidget {
  const CommentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: BlocBuilder<CommentsCubit, CommentsState>(
        builder: (context, state) {
          if (state is CommentsLoaded) {
            return RefreshIndicator(
              onRefresh: context.read<CommentsCubit>().loadComments,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.comments.length,
                itemBuilder: (context, index) {
                  Comment currentComment = state.comments[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: const TextStyle(color: Colors.black),
                                  children: [
                                    const TextSpan(text: "name:  "),
                                    TextSpan(
                                      text: currentComment.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  style: const TextStyle(color: Colors.black),
                                  children: [
                                    const TextSpan(text: "email:  "),
                                    TextSpan(
                                      text: currentComment.email,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                color: Colors.black,
                              ),
                              Text(currentComment.body),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }
          if (state is CommentsError) {
            return ErrorInformation(
              onPressed: context.read<CommentsCubit>().loadComments,
            );
          }
          return ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                double screenWidth = MediaQuery.of(context).size.width;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                color: Colors.grey,
                                height: 20,
                                width: screenWidth * 0.93,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                color: Colors.grey,
                                height: 20,
                                width: screenWidth * 0.5,
                              ),
                              const Divider(
                                color: Colors.black,
                              ),
                              Container(
                                color: Colors.grey,
                                height: 85,
                                width: screenWidth * 0.9,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
