import 'package:flutter/material.dart';
import 'package:shop_app/blocs/detail_product_bloc.dart';
import 'package:shop_app/blocs/cart_bloc.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/add_to_cart_model.dart';
import 'package:shop_app/models/cart_model.dart';
import 'package:shop_app/models/detail_product_model.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/models/detail_product_id_model.dart';
import 'package:shop_app/screens/detail_product/components/size-dots.dart';
import 'package:shop_app/service/storage_service.dart';
import 'package:shop_app/size_config.dart';
import 'package:shop_app/view_model/cart_view_model.dart';
import 'package:shop_app/view_model/detail_product_view_model.dart';
import 'package:shop_app/view_model/product_view_model.dart';

import '../details_screen.dart';
import 'color_dots.dart';
import 'product_description.dart';
import 'stores.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatelessWidget {
  final int productId;
  final InputForViewingFeedback? inputForViewingFeedback;
  DetailProductBloc _detailProductBloc = new DetailProductBloc();
  late Future<DetailProductResponse> _detailResponse;
  CartBloc _cartBloc = new CartBloc();
GetProductDetailIdRequest? getDetailProductRequest = new GetProductDetailIdRequest();
final StorageService _storageService = StorageService();
  Body({Key? key, required this.productId, this.inputForViewingFeedback}) : super(key: key);

Future<String?> getUserToken() async {
    return await _storageService.readSecureData("token");
  }

  Future<DetailProductResponse> getListProductById(int productId) async {
    
    var result = await _detailProductBloc.getDetailProduct(productId);
    var listColor= <Colour>[];
    var listSize = <Size>[]; 
    for(var productDetail in result.content!.productDetailList!){
        if(listColor.length == 0){
          listColor.add(productDetail.colour!);
          listSize.add(productDetail.size!);
        }else{
          if(listColor.where((element) => element.colourId == productDetail.colour!.colourId).isEmpty == true){
            listColor.add(productDetail.colour!);
          }
          if(listSize.where((element) => element.sizeId == productDetail.size!.sizeId).isEmpty == true){
            listSize.add(productDetail.size!);
          }
        }
    }
    result.setlistColor(listColor);
    result.setlistSize(listSize);

    return result;
  }

  Future<GetProductDetailResponse> getProductDetailId(GetProductDetailIdRequest request) async {
    DetailProductBloc service = new DetailProductBloc();
    var result = await service.getProductDetailId(request);
    return result;
  }

  Future<AddToCartResponse?> addToCart(AddToCarRequest cart, String token)
  async {
    try {
      return await _cartBloc.addToCart(cart, token);
    } catch (Exception) {
      print("l???i n??:"+Exception.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: getUserToken(),
      builder: (context, token){
        if(token.hasData){
          _detailResponse = getListProductById(productId);

    return FutureBuilder(
      future: _detailResponse,
      builder: (BuildContext context, AsyncSnapshot<DetailProductResponse> snapshot){
      if(snapshot.hasData){
        inputForViewingFeedback!.urlImage = snapshot.data!.content!.images![0].imageUrl!;
             return 
    ListView(
      children: [
        ProductImages(product: snapshot.data!.content),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: snapshot.data!.content,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    ColorDots( listColor: snapshot.data!.listColor, getQuantityRequest: getDetailProductRequest),
                    SizedBox(height: 10),
                    SizeDots(listSize: snapshot.data!.listSize, getQuantityRequest: getDetailProductRequest),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: DefaultButton(
                          text: "Th??m v??o gi??? h??ng",
                          press: () async {
                              getDetailProductRequest!.productId = productId;
                              //print(quantityRequest!.colourId);
                              
                              var response = await getProductDetailId(getDetailProductRequest!);
                              if(response.content == 0){
                                _showToast(context,"H???t h??ng r???i b???n ??i vui l??ng ch???n thu???c t??nh kh??c");
                                return;
                              }
                             // print("S??? l?????ng quantity m?? ng?????i d??ng ch???n"+getDetailProductRequest!.quantity.toString());
                              var addToCartRequest = new AddToCarRequest(
                                  productDetailId: response.content,
                                  quantity: getDetailProductRequest!.quantity
                              );
                              addToCart(addToCartRequest, token.data!);
                              _showToast(context,"Th??m v??o gi??? h??ng th??nh c??ng");

                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
      }else{
        return Container(
          child: _buildProgressIndicator(),
        );
      }
    });
        }else{
          return _buildProgressIndicator();
        }
      });
    
   
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: 1.0,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }
}

 void _showToast(BuildContext context, String content) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(content),
        action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
