

import 'package:get_it/get_it.dart';
import 'package:shop_app/checkout_product.dart';
import 'package:shop_app/token.dart';

import 'twilio_verify.dart';

final locator = GetIt.instance;

void setup(){
  locator.registerLazySingleton<TwilioVerify>(() => TwilioVerify());
  locator.registerLazySingleton<CheckOutProducts>(() => CheckOutProducts());
  locator.registerLazySingleton<Token>(() => Token());
}