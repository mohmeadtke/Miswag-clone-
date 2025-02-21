import 'package:dartz/dartz.dart';
import '../../../../core/errors/Faillure.dart';
import '../repo/userRepo.dart';

class CreateaccountUseCase {
  final UserRepo userRepo;

  CreateaccountUseCase({required this.userRepo});

  Future<Either<Faillure, Unit>> call(
      String name, String email, String passWord) async {
    return await userRepo.createAccount(name, email, passWord);
  }
}
