import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/domain/common/model/cinema_model.dart';
import 'cinema_item.dart';

class CinemaHorizontalList extends StatelessWidget {
  final List<CinemaModel>? cinemas;
  final OnCinemaItemTap onTap;

  const CinemaHorizontalList({
    super.key,
    this.cinemas,
    required this.onTap,
  });

  final Axis _scrollDirection = Axis.horizontal;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 244,
      child: cinemas != null
          ? ListView.separated(
              padding: _padding(),
              scrollDirection: _scrollDirection,
              itemCount: cinemas!.length,
              itemBuilder: (context, index) {
                return CinemaItem(
                  cinema: cinemas!.elementAt(index), 
                  onTap: onTap
                );
              },
              separatorBuilder: (context, index) => _separator(),
            )
          : ListView.separated(
              padding: _padding(),
              scrollDirection: _scrollDirection,
              itemCount: 5,
              itemBuilder: (context, index) {
                return const CinemaItemShimmer();
              },
              separatorBuilder: (context, index) => _separator(),
            ),
    );
  }

  EdgeInsets _padding() => const EdgeInsets.symmetric(horizontal: 16);

  Gap _separator() => const Gap(16);
}