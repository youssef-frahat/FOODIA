import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../../model/special_offer_model/special_offer_model.dart';

abstract class SpecialOfferRepo {
  Future<Either<Failure, SpecialOfferModel>> specialOffers();
}
