import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/core.dart';
import '../../../../core/data/constant/url_constant.dart';
import '../../../../core/domain/common/model/cinema_model.dart';

typedef OnCinemaItemTap = Function(CinemaModel post);

const double _width = 150, _imageHeight = 200;

class CinemaItem extends StatelessWidget {
  final CinemaModel cinema;
  final OnCinemaItemTap onTap;
  final double? height;
  final double width;

  const CinemaItem({
    super.key,
    required this.cinema,
    required this.onTap,
    this.height,
    this.width = _width,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(cinema),
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
            cinema.url?.w500Image ?? '',
            fit: BoxFit.cover,
            width: width,
            height: _imageHeight,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          cinema.name ?? '',
          overflow: TextOverflow.ellipsis,
          style: context.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class CinemaItemShimmer extends StatelessWidget {
  final double width;

  const CinemaItemShimmer({
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
