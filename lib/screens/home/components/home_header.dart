import 'package:flutter/material.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';

import '../../../blocs/cart_bloc.dart';
import '../../../models/cart_model.dart';
import '../../../service/storage_service.dart';
import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  StorageService _storageService = StorageService();
   HomeHeader({
    Key? key,
  }) : super(key: key);

Future<String?> getUserToken() async {
    return await _storageService.readSecureData("token");
  }

  static Future<int> getCountCart(String token) async {
    CartBloc service = new CartBloc();
    var result = await service.getCountCart(token);
    return result;
  }
  
  @override
  Widget build(BuildContext context) {
    return 
    FutureBuilder<String?>(
      future: getUserToken(),
      builder: ((context, token) {
        if(token.hasData){
return  FutureBuilder<int>(
          future: getCountCart(token.data!),
          builder: ((context, snapshot) {
            if(snapshot.hasData){
 return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Cart Icon.svg",
            press: () => Navigator.pushNamed(context, CartScreen.routeName),
            numOfitem: snapshot.data!,
          ),
        ],
      ),
    );
            }else{
              return Container();
            }
        }
        ))

;
        }return Container();
        
    }
    ));
    
  }
}
