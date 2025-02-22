import 'package:dartz/dartz.dart';
import 'package:miswag/Features/home/Data/DataSource/main_page_get_data.dart';
import 'package:miswag/Features/home/Domain/entity/main_page_entity.dart';
import 'package:miswag/Features/home/Domain/repo/main_page_repo.dart';
import 'package:miswag/core/errors/Faillure.dart';
import 'package:miswag/core/network/network.dart';

class MainPageRepoimpl implements MainPageRepo {
  final NetworkInfo networkInfo;
  final MainPageGetData mainPageGetData;
  MainPageRepoimpl({
    required this.networkInfo,
    required this.mainPageGetData,
  });

  @override
  Future<Either<Faillure, List<MainPageEntity>>> getdata() async {
    if (await networkInfo.isConnected) {
      try {
        final jsonData = await mainPageGetData.fetchLocalJson();
        return right(jsonData);
      } catch (e) {
        return left(const Faillure.serverError(
            message: "Something is wrong. Try again later"));
      }
    } else {
      return left(const Faillure.offlineError());
    }
  }
}
