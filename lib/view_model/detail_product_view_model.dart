
import 'package:shop_app/models/detail_product_id_model.dart';
import 'package:shop_app/models/detail_product_model.dart';
import 'package:shop_app/models/get_detail_fit_product.dart' as fitDetailProduct;
import 'package:shop_app/models/product_model.dart';

class DetailProductViewModel {
// static Future<DetailProductResponse> getListProductById(int productId) async {
//     DetailProductService service = new DetailProductService();
//     var result = await service.getDetailProduct(productId);
//     var listColor= <Colour>[];
//     var listSize = <Size>[]; 
//     for(var productDetail in result.content!.productDetailList!){
//         if(listColor.length == 0){
//           listColor.add(productDetail.colour!);
//           listSize.add(productDetail.size!);
//         }else{
//           if(listColor.where((element) => element.colourId == productDetail.colour!.colourId).isEmpty == true){
//             listColor.add(productDetail.colour!);
//           }
//           if(listSize.where((element) => element.sizeId == productDetail.size!.sizeId).isEmpty == true){
//             listSize.add(productDetail.size!);
//           }
//         }
//     }
//     result.setlistColor(listColor);
//     result.setlistSize(listSize);

//     return result;
//   }

  // static Future<GetProductDetailResponse> getProductDetailId(GetProductDetailIdRequest request) async {
  //   DetailProductService service = new DetailProductService();
  //   var result = await service.getProductDetailId(request);
  //   return result;
  // }

  // static Future<fitDetailProduct.GetDetailFitProductResponse> getDetailFitProduct(int productId, String token) async {
  //   DetailProductService service = new DetailProductService();
  //   var result = await service.getDetailFitProduct(productId, token);
  //   var listColor= <fitDetailProduct.Colour>[];
  //   var listSize = <fitDetailProduct.Size>[]; 
  //   for(var productDetail in result.content!.productDetailList!){
  //       if(listColor.length == 0){
  //         listColor.add(productDetail.colour!);
  //         listSize.add(productDetail.size!);
  //       }else{
  //         if(listColor.where((element) => element.colourId == productDetail.colour!.colourId).isEmpty == true){
  //           listColor.add(productDetail.colour!);
  //         }
  //         if(listSize.where((element) => element.sizeId == productDetail.size!.sizeId).isEmpty == true){
  //           listSize.add(productDetail.size!);
  //         }
  //       }
  //   }
  //   result.setlistColor(listColor);
  //   result.setlistSize(listSize);

  //   return result;
  // }

  // static Future<ProductResponseModel> getAllProducts() async {
  //   ProductService service = new ProductService();
  //   var result = await service.getAllProducts();
  //   return result;
  // }
}