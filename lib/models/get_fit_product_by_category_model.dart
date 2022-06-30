class GetFitProductByCategoryResponse {
  List<Content>? content;
  Null? error;
  bool? isSuccess;
  String? responseTime;

  GetFitProductByCategoryResponse(
      {this.content, this.error, this.isSuccess, this.responseTime});

  GetFitProductByCategoryResponse.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(new Content.fromJson(v));
      });
    }
    error = json['error'];
    isSuccess = json['is_success'];
    responseTime = json['response_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.content != null) {
      data['content'] = this.content!.map((v) => v.toJson()).toList();
    }
    data['error'] = this.error;
    data['is_success'] = this.isSuccess;
    data['response_time'] = this.responseTime;
    return data;
  }
}

class Content {
  int? categoryId;
  Null? categoryName;
  int? quantityFitProduct;

  Content({this.categoryId, this.categoryName, this.quantityFitProduct});

  Content.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    quantityFitProduct = json['quantity_fit_product'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['quantity_fit_product'] = this.quantityFitProduct;
    return data;
  }
}