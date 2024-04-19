// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../core/data/data.dart' as _i7;
import '../../core/data/network/api_client.dart' as _i5;
import '../../core/data/network/network.dart' as _i9;
import '../../feature/detail/data/datasource/datasource.dart' as _i16;
import '../../feature/detail/data/datasource/detail_remote_datasource.dart'
    as _i8;
import '../../feature/detail/domain/repository/detail_repository.dart' as _i15;
import '../../feature/detail/domain/repository/repository.dart' as _i18;
import '../../feature/detail/domain/usecase/get_movie_detail_usecase.dart'
    as _i17;
import '../../feature/detail/domain/usecase/usecase.dart' as _i20;
import '../../feature/detail/presentation/cubit/detail_cubit.dart' as _i19;
import '../../feature/home/data/datasource/datasource.dart' as _i11;
import '../../feature/home/data/datasource/home_remote_datasource.dart' as _i6;
import '../../feature/home/domain/repository/home_repository.dart' as _i10;
import '../../feature/home/domain/usecase/get_top_rated_movies_use_case.dart'
    as _i12;
import '../../feature/home/home.dart' as _i14;
import '../../feature/home/presentation/cubit/home_cubit.dart' as _i13;
import '../../feature/maps/presentation/cubit/map_detail_cubit.dart' as _i4;
import '../../feature/maps/presentation/cubit/maps_cubit.dart' as _i3;
import 'core.injection.dart' as _i21;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final coreInjectionModule = _$CoreInjectionModule();
    gh.factory<_i3.MapsCubit>(() => _i3.MapsCubit());
    gh.factory<_i4.MapDetailCubit>(() => _i4.MapDetailCubit());
    gh.lazySingleton<_i5.ApiClient>(() => coreInjectionModule.apiClient);
    gh.lazySingleton<_i6.HomeRemoteDataSource>(
        () => _i6.HomeRemoteDataSourceImpl(client: gh<_i7.ApiClient>()));
    gh.lazySingleton<_i8.DetailRemoteDataSource>(
        () => _i8.DetailRemoteDataSourceImpl(client: gh<_i9.ApiClient>()));
    gh.lazySingleton<_i10.HomeRepository>(() => _i10.HomeRepositoryImpl(
        remoteDataSource: gh<_i11.HomeRemoteDataSource>()));
    gh.lazySingleton<_i12.GetTopRatedMoviesUseCase>(
        () => _i12.GetTopRatedMoviesUseCase(gh<_i10.HomeRepository>()));
    gh.factory<_i13.HomeCubit>(
        () => _i13.HomeCubit(gh<_i14.GetTopRatedMoviesUseCase>()));
    gh.lazySingleton<_i15.DetailRepository>(() => _i15.DetailRepositoryImpl(
        remoteDataSource: gh<_i16.DetailRemoteDataSource>()));
    gh.lazySingleton<_i17.GetMovieDetailUseCase>(
        () => _i17.GetMovieDetailUseCase(gh<_i18.DetailRepository>()));
    gh.factory<_i19.DetailCubit>(
        () => _i19.DetailCubit(gh<_i20.GetMovieDetailUseCase>()));
    return this;
  }
}

class _$CoreInjectionModule extends _i21.CoreInjectionModule {}
