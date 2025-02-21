import 'package:dartz/dartz.dart';
import '../../../../core/errors/Faillure.dart';
import '../repo/userRepo.dart';

class SigninUseCase {
  final UserRepo userRepo;

  SigninUseCase({required this.userRepo});

  Future<Either<Faillure, Unit>> call(String email, String passWord) async {
    return await userRepo.signIn(email, passWord);
  }
}
