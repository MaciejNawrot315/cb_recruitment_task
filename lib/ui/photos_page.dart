import 'package:cached_network_image/cached_network_image.dart';
import 'package:code_borthers_recruitment_task/cubits/photos/photos_cubit.dart';
import 'package:code_borthers_recruitment_task/models/photo.dart';
import 'package:code_borthers_recruitment_task/ui/my_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotosPage extends StatelessWidget {
  const PhotosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotosCubit, PhotosState>(
      builder: (context, state) {
        if (state is PhotosLoaded) {
          return RefreshIndicator(
            onRefresh: context.read<PhotosCubit>().loadPhotos,
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: state.photos.length,
              itemBuilder: (context, index) {
                Photo currentPhoto = state.photos[index];
                return GestureDetector(
                  onTap: () => showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MyCashedNetworkImage(
                            url: currentPhoto.url,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 20.0),
                            child: Text(currentPhoto.title),
                          ),
                        ],
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: MyCashedNetworkImage(
                      url: currentPhoto.thumbnailUrl,
                    ),
                  ),
                );
              },
            ),
          );
        }
        if (state is PhotosError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("We couldn't load your data"),
                TextButton(
                  onPressed: context.read<PhotosCubit>().loadPhotos,
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blue),
                  ),
                  child: const Text(
                    "Retry",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
