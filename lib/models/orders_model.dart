class OrdersResponse {
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

  OrdersResponse(
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

  OrdersResponse.fromJson(Map<String, dynamic> json) {
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
  int? orderId;
  String? createDate;
  double? totalPrice;
  double? totalPriceAfterDiscount;
  String? orderType;
  String? status;

  Content(
      {this.orderId,
      this.createDate,
      this.totalPrice,
      this.totalPriceAfterDiscount,
      this.orderType,
      this.status});

  Content.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    createDate = json['create_date'];
    totalPrice = json['total_price'];
    totalPriceAfterDiscount = json['total_price_after_discount'];
    orderType = json['order_type'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['create_date'] = this.createDate;
    data['total_price'] = this.totalPrice;
    data['total_price_after_discount'] = this.totalPriceAfterDiscount;
    data['order_type'] = this.orderType;
    data['status'] = this.status;
    return data;
  }
}