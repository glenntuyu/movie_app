import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../../config/router/app_router.dart';
import '../../../../core/core.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../../config/di/injection.dart';
import '../../../../core/domain/common/model/cinema_model.dart';
import '../cubit/home_cubit.dart';
import '../widget/cinema_horizontal_list.dart';
import '../widget/widget.dart';

@RoutePage()
class HomePage extends StatefulWidget implements AutoRouteWrapper {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: getIt<HomeCubit>(),
      child: this,
    );
  }
}

class _HomePageState extends State<HomePage> {
  final PagingController<int, MovieModel> _pagingController = PagingController(
    firstPageKey: 1,
  );

  @override
  void initState() {
    _getInitialData();
    _listenPagingController();

    super.initState();
  }

  void _getInitialData() {
    _getCinemas();
  }

  void _getCinemas() {
    context.read<HomeCubit>().getCinemas();
  }

  void _listenPagingController() {
    _pagingController.addPageRequestListener((page) async {
      _fetchTopRatedMovies(page: page);
    });
  }

  void _fetchTopRatedMovies({
    required int page,
  }) {
    context.read<HomeCubit>().getTopRatedMovies(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text(
        'Movie App',
        style: context.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      leadingWidth: 40,
      automaticallyImplyLeading: false,
      actions: [
        _notificationIcon(),
      ],
      leading: _profileAvatar(),
    );
  }

  Widget _notificationIcon() {
    return Container(
      height: 26,
      width: 26,
      margin: const EdgeInsets.only(right: 16),
      child: SvgPicture.asset(
        'assets/icon/notification.svg',
        fit: BoxFit.fitWidth,
        colorFilter: const ColorFilter.mode(
          Colors.white,
          BlendMode.srcIn,
        ),
      ),
    );
  }

  Widget _profileAvatar() {
    return Transform.translate(
      offset: const Offset(16, 0),
      child: CircleAvatar(
        radius: 32,
        backgroundColor: Colors.transparent,
        child: SvgPicture.asset(
          'assets/avatar/profile.svg',
          height: 32,
          width: 32,
        ),
      ),
    );
  }

  Widget _body() {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        _onBlocStateChange(state);
      },
      child: CustomScrollView(
        slivers: [
          MultiSliver(
            children: [
              const Gap(16),
              _cinema(),
              const Gap(24),
              ..._topRated(),
              const Gap(48),
            ],
          ),
        ],
      ),
    );
  }

  Widget _cinema() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _cinemaSectionTitle(),
        BlocBuilder<HomeCubit, HomeState>(
          buildWhen: (previous, current) => _cinemaBuildWhen(current),
          builder: (context, state) {
            return CinemaHorizontalList(
              onTap: _navigateToMapDetail,
              cinemas: context.read<HomeCubit>().cinemas,
            );
          },
        )
      ],
    );
  }

  Widget _cinemaSectionTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        direction: Axis.horizontal,
        runSpacing: 8,
        spacing: 8,
        children: [
          _sectionTitle('Cinemas'),
          _locateCinemasTitle()
        ],
      ),
    );
  }

  Widget _locateCinemasTitle() {
    return InkWell(
      onTap: () {
        _navigateToMaps();
      },
      child: Container(
        padding: const EdgeInsets.only(top: 8),
        child: Text(
          '(Locate All)',
          style: context.bodySmall?.copyWith(
            color: Colors.lightBlue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void _navigateToMaps() {
    context.router.push(
      const MapsRoute(),
    );
  }

  bool _cinemaBuildWhen(HomeState current) =>
      current is GetCinemaLoaded ||
      current is GetCinemaLoading ||
      current is GetCinemaError;

  void _navigateToMapDetail(CinemaModel post) {
    context.router.push(
      MapDetailRoute(
        lat: post.lat,
        long: post.long,
        title: post.name,
      ),
    );
  }

  List<Widget> _topRated() {
    return [
      SliverToBoxAdapter(
        child: _sectionTitle('Top Rated Movies'),
      ),
      MoviePagedList(
        source: NavigationSource.topRated,
        onTap: _navigateToDetail,
        pagingController: _pagingController,
      ),
    ];
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 16),
      child: Text(
        text,
        style: context.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  void _navigateToDetail(MovieModel post, NavigationSource source) {
    context.router.push(
      DetailRoute(
        id: post.id,
        title: post.title,
        imageUrl: post.posterPath,
        source: source.value,
      ),
    );
  }

  void _onBlocStateChange(HomeState state) {
    if (state is GetTopRatedMoviesLoaded) {
      _onMoviesLoaded(state);
    } else if (state is GetTopRatedMoviesError) {
      _showSnackbarError(state.message);
    }
  }

  void _onMoviesLoaded(GetTopRatedMoviesLoaded state) {
    final isLastPage = state.movies.page == state.movies.totalPages;

    if (isLastPage) {
      _pagingController.appendLastPage(state.movies.results);
    } else {
      final nextPageKey = (state.movies.page ?? 0) + 1;
      _pagingController.appendPage(state.movies.results, nextPageKey);
    }
  }

  void _showSnackbarError(String message) {
    context.showSnackBar(message: message);
  }
}