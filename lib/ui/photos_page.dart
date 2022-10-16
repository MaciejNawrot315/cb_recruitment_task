import 'package:code_borthers_recruitment_task/cubits/photos/photos_cubit.dart';
import 'package:code_borthers_recruitment_task/models/photo.dart';
import 'package:code_borthers_recruitment_task/ui/error_information.dart';
import 'package:code_borthers_recruitment_task/ui/my_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class PhotosPage extends StatelessWidget {
  const PhotosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotosCubit, PhotosState>(
      builder: (context, state) {
        if (state is PhotosInitialError) {
          return ErrorInformation(
            onPressed: context.read<PhotosCubit>().loadPhotos,
            errorMessage: state.errorMessage,
          );
        }
        if (state is PhotosInitialLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return LazyLoadScrollView(
          onEndOfPage: () => state is PhotosFullyLoaded
              ? null
              : context.read<PhotosCubit>().loadMorePhotos(),
          isLoading: state is PhotosLoading,
          scrollOffset: 300,
          child: RefreshIndicator(
            onRefresh: context.read<PhotosCubit>().loadPhotos,
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: state.photos.length + 2,
              itemBuilder: (context, index) {
                if (index == state.photos.length) {
                  return const SizedBox();
                }
                if (index == state.photos.length + 1) {
                  if (state is PhotosMoreDownloadError) {
                    return Column(
                      children: const [
                        Text(
                          "No Internet,",
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "re-drag to retry",
                          textAlign: TextAlign.center,
                        ),
                      ],
                    );
                  }
                  if (state is PhotosFullyLoaded) {
                    return Column(
                      children: const [
                        Text("the end"),
                        Icon(Icons.emoji_emotions_outlined),
                      ],
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
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
          ),
        );
      },
    );
  }
}
