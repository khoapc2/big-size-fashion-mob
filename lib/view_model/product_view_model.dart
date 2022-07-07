
import 'package:shop_app/api/api_get_product_service.dart';
import 'package:shop_app/models/get_fit_product_by_category_model.dart';
import 'package:shop_app/models/get_list_fit_product_by_category_model.dart';
import 'package:shop_app/models/get_list_product_by_category_model.dart';
import 'package:shop_app/models/get_popular_product.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/models/detail_product_id_model.dart';

class ProductViewModel {
static Future<ProductResponseModel> getListProductByNameSearch(String? searchValue) async {
    ProductService service = new ProductService();
    var result = await service.getListProductByName(searchValue);
    return result;
  }

  static Future<ProductResponseModel> getAllProducts(int page) async {
    ProductService service = new ProductService();
    var result = await service.getAllProducts(page);
    return result;
  }

  static Future<GetListPopularProductResponse> getPopularProducts() async {
    ProductService service = new ProductService();
    var result = await service.getPoularProducts();
    return result;
  }

  static Future<GetFitProductByCategoryResponse> getFitProductByCategory() async {
    ProductService service = new ProductService();
    var result = await service.getFitProductsByCategory();
    return result;
  }

  static Future<GetListProductByCategoryResponse> getProductsByCategory(String categoryName) async {
    ProductService service = new ProductService();
    var result = await service.getListProductByCategory(categoryName);
    return result;
  }

  static Future<GetListFitProductByCategoryResponse> getFitProductsByCategory(String categoryName, int page) async {
    ProductService service = new ProductService();
    var result = await service.getListFitProductByCategory(categoryName, page);
    return result;
  }
}
