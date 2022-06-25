
import 'package:shop_app/api/api_get_product_service.dart';
import 'package:shop_app/models/product_model.dart';

class ProductViewModel {
static Future<ProductResponseModel> getListProductByNameSearch(String? searchValue) async {
    ProductService service = new ProductService();
    var result = await service.getListProductByName(searchValue);
    return result;
  }

  static Future<ProductResponseModel> getAllProducts() async {
    ProductService service = new ProductService();
    var result = await service.getAllProducts();
    return result;
  }
}
