import 'package:dartz/dartz.dart';
import 'package:miswag/Features/home/Domain/entity/main_page_entity.dart';

import 'package:miswag/core/errors/Faillure.dart';

abstract class MainPageRepo {
  Future<Either<Faillure, List<MainPageEntity>>> getdata();
}
