import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:miswag/Features/home/Data/DataSource/main_page_get_data.dart';
import 'package:miswag/Features/home/Data/repoimpl/main_page_repoimpl.dart';
import 'package:miswag/Features/home/Domain/repo/main_page_repo.dart';
import 'package:miswag/Features/home/Domain/usecase/main_page_usecase.dart';
import 'package:miswag/Features/home/Presentation/state_mangment/bloc/main_page_bloc.dart';
import 'package:miswag/core/network/network.dart';

final sl = GetIt.instance;

void init() {
//! Features
//? home
  //repo
  sl.registerLazySingleton<MainPageRepo>(
      () => MainPageRepoimpl(networkInfo: sl(), mainPageGetData: sl()));
  //usecase
  sl.registerLazySingleton(() => MainPageUsecase(mainPageRepo: sl()));
  //data
  sl.registerFactory(() => MainPageGetData());
  //bloc
  sl.registerFactory(() => MainPageBloc(mainPageUsecase: sl()));
// //?Create a team
//   //repo
//   sl.registerLazySingleton<TeamRepo>(() => TeamRepoImpl(
//       networkInfo: sl(), addTeamImage: sl(), createTeamDataSource: sl()));
//   //useCase
//   sl.registerLazySingleton(() => CreateTeamUseCase(teamRepo: sl()));
//   //data
//   sl.registerFactory(() => AddTeamImage());
//   sl.registerFactory(() => CreateTeamDataSource());
//   //bloc
//   sl.registerFactory(() => CreateTeamBloc(createTeamUseCase: sl()));
// //?auth
//   //bloc
//   sl.registerFactory(() => AuthBloc(
//       createaccountUseCase: sl(),
//       signinUseCase: sl(),
//       signinwithgoogleUseCase: sl()));
//   //useCase
//   sl.registerLazySingleton(() => CreateaccountUseCase(userRepo: sl()));
//   sl.registerLazySingleton(() => SigninUseCase(userRepo: sl()));
//   sl.registerLazySingleton(() => SigninwithgoogleUseCase(userRepo: sl()));
//   //repo
//   sl.registerLazySingleton<UserRepo>(() => UserRepoImpl(
//       networkInfo: sl(),
//       createAccountClass: sl(),
//       signInClass: sl(),
//       signInWithGoogleClass: sl()));
//   //data
//   sl.registerFactory(() => CreateAccount());
//   sl.registerFactory(() => SignIn());
//   sl.registerFactory(() => SignInWithGoogle());
  //core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton(() => InternetConnection());
}
