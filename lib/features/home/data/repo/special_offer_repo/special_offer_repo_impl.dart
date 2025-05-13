import 'package:dartz/dartz.dart';
import 'package:foodia_app/core/errors/failures.dart';
import 'package:foodia_app/core/networking/api/api_services.dart';
import 'package:foodia_app/features/home/data/model/special_offer_model/special_offer_model.dart';
import 'package:foodia_app/features/home/data/repo/special_offer_repo/special_offer_repo.dart';

import '../../../../../core/app_config/app_strings.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/networking/api/end_points.dart';

class SpecialOfferRepoImpl  implements SpecialOfferRepo{
  final ApiService apiServices;

  SpecialOfferRepoImpl(this.apiServices);

 @override
Future<Either<Failure, SpecialOfferModel>> specialOffers() async {
  try {
    final response = await apiServices.get(EndPoints.specialOffer);
    SpecialOfferModel specialOffer = SpecialOfferModel.fromJson(response);
    return Right(specialOffer);
  } on NetworkException catch (e) {
    return Left(NetworkFailure(e.message));
  } on ServerException catch (e) {
    return Left(ServerFailure(e.message));
  } catch (e) {
    return Left(ServerFailure(AppStrings.unexpectedError));
  }
}

}