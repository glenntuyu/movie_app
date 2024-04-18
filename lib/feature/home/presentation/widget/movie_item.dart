import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../../../core/core.dart';
import '../../../../core/data/constant/url_constant.dart';
import '../../../detail/presentation/widget/chip_attribute.dart';

typedef OnMovieItemTap = Function(MovieModel post, NavigationSource source);

const double _width = 150, _imageHeight = 250;

class MovieItem extends StatelessWidget {
  final MovieModel movie;
  final NavigationSource source;
  final OnMovieItemTap onTap;
  final double? height;
  final double width;

  const MovieItem({
    super.key,
    required this.movie,
    required this.source,
    required this.onTap,
    this.height,
    this.width = _width,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(movie, source),
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        width: width,
        height: height,
        child: _body(context),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: ImageNetwork(
            movie.posterPath?.w500Image ?? '',
            fit: BoxFit.cover,
            width: width,
            height: _imageHeight,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          movie.title,
          overflow: TextOverflow.ellipsis,
          style: context.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        _attribute(movie, context)
        
      ],
    );
  }
}

Widget _attribute(MovieModel movie, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 0),
    child: Wrap(
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.start,
      direction: Axis.horizontal,
      runSpacing: 8,
      spacing: 8,
      children: [
        _review(movie, context),
        _date(movie, context),
      ],
    ),
  );
}

Widget _review(MovieModel movie, BuildContext context) {
  var formatter = NumberFormat("###.#", "en_US");
  return ChipAttribute(
    formatter.format(movie.voteAverage),
    icon: const Icon(
      Icons.star,
      color: Colors.yellow,
      size: 14,
    ),
    style: context.labelSmall,
  );
}

Widget _date(MovieModel movie, BuildContext context) => ChipAttribute(
    movie.releaseDate?.formatDate() ?? '',
    style: context.labelSmall,
  );

class MovieItemShimmer extends StatelessWidget {
  final double width;

  const MovieItemShimmer({
    super.key,
    this.width = _width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _imageHeight,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _image(),
          const Gap(8),
          _text(),
          const Gap(4),
          _text(),
        ],
      ),
    );
  }

  Widget _image() {
    return const Expanded(
      child: ShimmerWidget(
        radius: 16,
      ),
    );
  }

  Widget _text() {
    return const ShimmerWidget(
      height: 16,
      radius: 8,
    );
  }
}