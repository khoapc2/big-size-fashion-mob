import 'package:flutter/cupertino.dart';

class DetailProductResponse {
  Content? content;
  Null? error;
  bool? isSuccess;
  String? responseTime;
  List<Colour>? listColor;
  List<Size>? listSize;

  DetailProductResponse(
      {this.content, this.error, this.isSuccess, this.responseTime});

  DetailProductResponse.fromJson(Map<String, dynamic> json) {
    content =
        json['content'] != null ? new Content.fromJson(json['content']) : null;
    error = json['error'];
    isSuccess = json['is_success'];
    responseTime = json['response_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.content != null) {
      data['content'] = this.content!.toJson();
    }
    data['error'] = this.error;
    data['is_success'] = this.isSuccess;
    data['response_time'] = this.responseTime;
    return data;
  }
void setlistColor(List<Colour> listColour){
    this.listColor = listColour;
}

void setlistSize(List<Size> listSize){
    this.listSize = listSize;
}

}




class Content {
  int? productId;
  int? productDetailId;
  String? productName;
  double? price;
  Null? promotionPrice;
  Null? promotionValue;
  String? category;
  List<ProductDetailList>? productDetailList;
  String? gender;
  List<Images>? images;
  String? brand;
  String? description;
  bool? status;

  Content(
      {this.productId,
      this.productDetailId,
      this.productName,
      this.price,
      this.promotionPrice,
      this.promotionValue,
      this.category,
      this.productDetailList,
      this.gender,
      this.images,
      this.brand,
      this.description,
      this.status});

  Content.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productDetailId = json['product_detail_id'];
    productName = json['product_name'];
    price = json['price'];
    promotionPrice = json['promotion_price'];
    promotionValue = json['promotion_value'];
    category = json['category'];
    if (json['product_detail_list'] != null) {
      productDetailList = <ProductDetailList>[];
      json['product_detail_list'].forEach((v) {
        productDetailList!.add(new ProductDetailList.fromJson(v));
      });
    }
    gender = json['gender'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    brand = json['brand'];
    description = json['description'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['product_detail_id'] = this.productDetailId;
    data['product_name'] = this.productName;
    data['price'] = this.price;
    data['promotion_price'] = this.promotionPrice;
    data['promotion_value'] = this.promotionValue;
    data['category'] = this.category;
    if (this.productDetailList != null) {
      data['product_detail_list'] =
          this.productDetailList!.map((v) => v.toJson()).toList();
    }
    data['gender'] = this.gender;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['brand'] = this.brand;
    data['description'] = this.description;
    data['status'] = this.status;
    return data;
  }
}

class ProductDetailList {
  int? productDetailId;
  int? productId;
  Size? size;
  Colour? colour;

  ProductDetailList(
      {this.productDetailId, this.productId, this.size, this.colour});

  ProductDetailList.fromJson(Map<String, dynamic> json) {
    productDetailId = json['product_detail_id'];
    productId = json['product_id'];
    size = json['size'] != null ? new Size.fromJson(json['size']) : null;
    colour =
        json['colour'] != null ? new Colour.fromJson(json['colour']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_detail_id'] = this.productDetailId;
    data['product_id'] = this.productId;
    if (this.size != null) {
      data['size'] = this.size!.toJson();
    }
    if (this.colour != null) {
      data['colour'] = this.colour!.toJson();
    }
    return data;
  }
}

class Size {
  int? sizeId;
  String? sizeName;
  bool? status;

  Size({this.sizeId, this.sizeName, this.status});

  Size.fromJson(Map<String, dynamic> json) {
    sizeId = json['size_id'];
    sizeName = json['size_name'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['size_id'] = this.sizeId;
    data['size_name'] = this.sizeName;
    data['status'] = this.status;
    return data;
  }
}

class Colour {
  int? colourId;
  String? colourName;
  String? colourCode;
  bool? status;

  Colour({this.colourId, this.colourName, this.colourCode, this.status});

  Colour.fromJson(Map<String, dynamic> json) {
    colourId = json['colour_id'];
    colourName = json['colour_name'];
    colourCode = json['colour_code'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['colour_id'] = this.colourId;
    data['colour_name'] = this.colourName;
    data['colour_code'] = this.colourCode;
    data['status'] = this.status;
    return data;
  }
}

class Images {
  int? productImageId;
  int? productId;
  String? imageUrl;
  bool? isMainImage;

  Images(
      {this.productImageId, this.productId, this.imageUrl, this.isMainImage});

  Images.fromJson(Map<String, dynamic> json) {
    productImageId = json['product_image_id'];
    productId = json['product_id'];
    imageUrl = json['image_url'];
    isMainImage = json['is_main_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_image_id'] = this.productImageId;
    data['product_id'] = this.productId;
    data['image_url'] = this.imageUrl;
    data['is_main_image'] = this.isMainImage;
    return data;
  }
}