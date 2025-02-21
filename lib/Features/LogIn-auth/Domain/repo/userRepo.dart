import 'package:dartz/dartz.dart';
import 'package:miswag/core/errors/Faillure.dart';

abstract class UserRepo {
  Future<Either<Faillure, Unit>> signIn(String email, String passWord);

  Future<Either<Faillure, Unit>> createAccount(
      String name, String email, String passWord);

  // Future<Either<Faillure, Unit>> signInWithGoogle();
}
