// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../core/data/data.dart' as _i5;
import '../../core/data/network/api_client.dart' as _i3;
import '../../feature/home/data/datasource/datasource.dart' as _i7;
import '../../feature/home/data/datasource/home_remote_datasource.dart' as _i4;
import '../../feature/home/domain/repository/home_repository.dart' as _i6;
import '../../feature/home/domain/usecase/get_top_rated_movies_use_case.dart' as _i8;
import '../../feature/home/home.dart' as _i10;
import '../../feature/home/presentation/cubit/home_cubit.dart' as _i9;
import 'core.injection.dart' as _i11;

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
    gh.lazySingleton<_i3.ApiClient>(() => coreInjectionModule.apiClient);
    gh.lazySingleton<_i4.HomeRemoteDataSource>(
        () => _i4.HomeRemoteDataSourceImpl(client: gh<_i5.ApiClient>()));
    gh.lazySingleton<_i6.HomeRepository>(() => _i6.HomeRepositoryImpl(
        remoteDataSource: gh<_i7.HomeRemoteDataSource>()));
    gh.lazySingleton<_i8.GetTopRatedMoviesUseCase>(
        () => _i8.GetTopRatedMoviesUseCase(gh<_i6.HomeRepository>()));
    gh.factory<_i9.HomeCubit>(() => _i9.HomeCubit(gh<_i10.GetTopRatedMoviesUseCase>()));
    return this;
  }
}

class _$CoreInjectionModule extends _i11.CoreInjectionModule {}
