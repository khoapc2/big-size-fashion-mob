class GetListProductByCategoryResponse {
  int? currentPage;
  int? totalPages;
  int? pageSize;
  int? totalCount;
  bool? hasPrevious;
  bool? hasNext;
  List<Content>? content;
  Null? error;
  bool? isSuccess;
  String? responseTime;

  GetListProductByCategoryResponse(
      {this.currentPage,
      this.totalPages,
      this.pageSize,
      this.totalCount,
      this.hasPrevious,
      this.hasNext,
      this.content,
      this.error,
      this.isSuccess,
      this.responseTime});

  GetListProductByCategoryResponse.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    totalPages = json['total_pages'];
    pageSize = json['page_size'];
    totalCount = json['total_count'];
    hasPrevious = json['has_previous'];
    hasNext = json['has_next'];
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
    data['current_page'] = this.currentPage;
    data['total_pages'] = this.totalPages;
    data['page_size'] = this.pageSize;
    data['total_count'] = this.totalCount;
    data['has_previous'] = this.hasPrevious;
    data['has_next'] = this.hasNext;
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
  int? productId;
  String? productName;
  double? price;
  double? promotionPrice;
  String? promotionValue;
  String? imageUrl;
  bool? status;

  Content(
      {this.productId,
      this.productName,
      this.price,
      this.promotionPrice,
      this.promotionValue,
      this.imageUrl,
      this.status});

  Content.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    price = json['price'];
    promotionPrice = json['promotion_price'];
    promotionValue = json['promotion_value'];
    imageUrl = json['image_url'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['price'] = this.price;
    data['promotion_price'] = this.promotionPrice;
    data['promotion_value'] = this.promotionValue;
    data['image_url'] = this.imageUrl;
    data['status'] = this.status;
    return data;
  }
}