import 'package:equatable/equatable.dart';

class GetMoviesPaginationParam extends Equatable {
  final int page;

  const GetMoviesPaginationParam({
    this.page = 1,
  });

  @override
  List<Object?> get props => [
        page,
      ];
}