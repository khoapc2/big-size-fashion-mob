import 'package:flutter/material.dart';
import 'package:shop_app/blocs/detail_product_bloc.dart';
import 'package:shop_app/blocs/cart_bloc.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/models/add_to_cart_model.dart';
import 'package:shop_app/models/cart_model.dart';
import 'package:shop_app/models/get_detail_fit_product.dart';
import 'package:shop_app/models/detail_product_id_model.dart';
import 'package:shop_app/screens/detail_fit_product/components/size-dots.dart';
import 'package:shop_app/service/storage_service.dart';
import 'package:shop_app/size_config.dart';
import 'package:shop_app/models/get_detail_fit_product.dart' as fitDetailProduct;

import '../../detail_product/details_screen.dart';
import 'color_dots.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatefulWidget {
  final int productId;
  final InputForViewingFeedback? inputForViewingFeedback;
  


  Body({Key? key, required this.productId, this.inputForViewingFeedback}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _StateBody();
}

class _StateBody extends State<Body>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDetailProductRequest!.productId = widget.productId;
  }

  GetProductDetailIdRequest? getDetailProductRequest = new GetProductDetailIdRequest();
  final StorageService _storageService = StorageService();
  DetailProductBloc _detailProductBloc = new DetailProductBloc();
  late GetProductDetailResponse response;
   CartBloc _cartBloc = new CartBloc();


  Future<String?> getUserToken() async {
    return await _storageService.readSecureData("token");
  }

  void updateTotal() async{
    print("updateTotal is call");
    
      var response = await getProductDetailId(getDetailProductRequest!);
                              if(response.content == 0){
                                getDetailProductRequest!.total = 0;
                                return;
                              }
                              var totalProduct = await getTotalByProductDetailId(response.content!);
                              
   setState(() {
     getDetailProductRequest!.total = totalProduct;
   });
  }

  Future<int> getTotalByProductDetailId(int productDetailId) async {
       var response = await  _detailProductBloc.getQuantityByProductId(productDetailId);
       return response.content!.quantity!;
  }

   Future<fitDetailProduct.GetDetailFitProductResponse> getDetailFitProduct(int productId, String token) async {
    var result = await _detailProductBloc.getDetailFitProduct(productId, token);
    var listColor= <fitDetailProduct.Colour>[];
    var listSize = <fitDetailProduct.Size>[]; 
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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: getUserToken(),
      builder:(context, token){
        if(token.hasData){
    return FutureBuilder(
      future: getDetailFitProduct(widget.productId, token.data!),
      builder: (BuildContext context, AsyncSnapshot<GetDetailFitProductResponse> snapshot){
      if(snapshot.hasData){
        widget.inputForViewingFeedback!.urlImage = snapshot.data!.content!.images![0].imageUrl!;
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
              Container(
                width: 330,
                child: Text("Số lượng: "+getDetailProductRequest!.total.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),)
              ),
              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    ColorDots( listColor: snapshot.data!.listColor, getQuantityRequest: getDetailProductRequest, updateTotal: updateTotal,),
                    
                    SizedBox(height: 5),
                    SizeDots(listSize: snapshot.data!.listSize, getQuantityRequest: getDetailProductRequest, updateTotal: updateTotal),
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
                          text: "Thêm vào giỏ hàng",
                          press: () async {
                              getDetailProductRequest!.productId = widget.productId;
                              //print(quantityRequest!.colourId);
                              
                              response = await getProductDetailId(getDetailProductRequest!);
                             // print("Số lượng quantity mà người dùng chọn"+getDetailProductRequest!.quantity.toString());
                              var addToCartRequest = new AddToCarRequest(
                                  productDetailId: response.content,
                                  quantity: getDetailProductRequest!.quantity
                              );
                              addToCart(addToCartRequest, token.data!);
                              _showToast(context);

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

    Future<GetProductDetailResponse> getProductDetailId(GetProductDetailIdRequest request) async {
    
    var result = await _detailProductBloc.getProductDetailId(request);
    return result;
  }
    Future<AddToCartResponse?> addToCart(AddToCarRequest cart, String token)
  async {
   
    try {
      return await _cartBloc.addToCart(cart, token);
    } catch (Exception) {
      print("lỗi nè:"+Exception.toString());
    }
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

 void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Thêm vào giỏ hàng thành công'),
        action: SnackBarAction(label: '', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
