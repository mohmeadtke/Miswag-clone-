import 'package:dartz/dartz.dart';
import 'package:miswag/Features/home/Domain/entity/main_page_entity.dart';
import 'package:miswag/Features/home/Domain/repo/main_page_repo.dart';
import 'package:miswag/core/errors/Faillure.dart';

class MainPageUsecase {
  final MainPageRepo mainPageRepo;

  MainPageUsecase({required this.mainPageRepo});

  Future<Either<Faillure, List<MainPageEntity>>> call() async {
    return await mainPageRepo.getdata();
  }
}
