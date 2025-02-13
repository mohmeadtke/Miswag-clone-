import 'package:dartz/dartz.dart';
import 'package:miswag/Features/home/Domain/entity/main_page_entity.dart';
import 'package:miswag/Features/home/Domain/repo/main_page_repo.dart';
import 'package:miswag/core/errors/Faillure.dart';
import 'package:miswag/core/network/network.dart';

class MainPageRepoimpl {
  final NetworkInfo networkInfo;
  final MainPageRepo mainPageRepo;

  MainPageRepoimpl({required this.networkInfo, required this.mainPageRepo});
  Future<Either<Faillure, MainPageEntity>> getdata() async {
    if (await networkInfo.isConnected) {
      try {
        return left(Faillure.invalidData());
      } catch (e) {
        return left(const Faillure.serverError(
            message: "SomeThing Wrong try agin later"));
      }
    } else {
      return left(const Faillure.offlineError());
    }
  }
}
