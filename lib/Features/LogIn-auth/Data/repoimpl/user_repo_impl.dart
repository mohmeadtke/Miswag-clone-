import 'package:dartz/dartz.dart';
import '../../../../core/errors/Faillure.dart';
import '../../../../core/network/network.dart';
import '../../Domain/repo/userRepo.dart';
import '../DataSource/createAccount.dart';
import '../DataSource/signIn.dart';

class UserRepoImpl implements UserRepo {
  final CreateAccount createAccountClass;
  final NetworkInfo networkInfo;
  final SignIn signInClass;
  // final SignInWithGoogle signInWithGoogleClass;

  UserRepoImpl({
    required this.networkInfo,
    required this.createAccountClass,
    required this.signInClass,
    // required this.signInWithGoogleClass,
  });

  @override
  Future<Either<Faillure, Unit>> createAccount(
      String name, String email, String password) async {
    return await _performNetworkCheck(() async {
      await createAccountClass.createAccount(name, email, password);
    });
  }

  @override
  Future<Either<Faillure, Unit>> signIn(String email, String password) async {
    return await _performNetworkCheck(() async {
      await signInClass.signIn(email, password);
    });
  }

  // @override
  // Future<Either<Faillure, Unit>> signInWithGoogle() async {
  //   return await _performNetworkCheck(() async {
  //     await signInWithGoogleClass.signInWithGoogle();
  //   });
  // }

  Future<Either<Faillure, Unit>> _performNetworkCheck(
      Future<void> Function() action) async {
    if (await networkInfo.isConnected) {
      try {
        await action();
        return const Right(unit);
      } catch (e) {
        print(e);

        return Left(Faillure.serverError(message: e.toString()));
      }
    } else {
      return const Left(Faillure.offlineError());
    }
  }
}
