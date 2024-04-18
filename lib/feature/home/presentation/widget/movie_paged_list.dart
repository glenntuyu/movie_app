import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../core/domain/common/model/movie_model.dart';
import 'movie_item.dart';

class MoviePagedList extends StatelessWidget {
  final OnMovieItemTap onTap;
  final PagingController<int, MovieModel> pagingController;

  const MoviePagedList({
    super.key,
    required this.onTap,
    required this.pagingController,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: PagedSliverMasonryGrid.count(
        pagingController: pagingController,
        builderDelegate: PagedChildBuilderDelegate<MovieModel>(
          itemBuilder: (context, movie, index) {
            return MovieItem(
              movie: movie,
              onTap: onTap,
              width: double.infinity,
            );
          },
          newPageProgressIndicatorBuilder: (context) {
            return _shimmer();
          },
          firstPageProgressIndicatorBuilder: (context) {
            return _shimmer();
          },
        ),
        crossAxisCount: 2,
        mainAxisSpacing: 24,
        crossAxisSpacing: 24,
      ),
    );
  }

  Widget _shimmer() {
    // TODO: fix shimmer
    return const MovieItemShimmer();
  }
}