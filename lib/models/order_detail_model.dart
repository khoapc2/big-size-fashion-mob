class OrderDetailResponse {
  Content? content;
  Null? error;
  bool? isSuccess;
  String? responseTime;

  OrderDetailResponse(
      {this.content, this.error, this.isSuccess, this.responseTime});

  OrderDetailResponse.fromJson(Map<String, dynamic> json) {
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
}

class Content {
  int? orderId;
  int? customerId;
  String? customerName;
  Null? deliveryAddress;
  Store? store;
  int? staffId;
  String? staffName;
  String? createDate;
  List<ProductList>? productList;
  double? totalPrice;
  double? totalPriceAfterDiscount;
  String? paymentMethod;
  String? orderType;
  String? approvalDate;
  String? packagedDate;
  String? deliveryDate;
  String? receivedDate;
  Null? rejectedDate;
  String? status;

  Content(
      {this.orderId,
      this.customerId,
      this.customerName,
      this.deliveryAddress,
      this.store,
      this.staffId,
      this.staffName,
      this.createDate,
      this.productList,
      this.totalPrice,
      this.totalPriceAfterDiscount,
      this.paymentMethod,
      this.orderType,
      this.approvalDate,
      this.packagedDate,
      this.deliveryDate,
      this.receivedDate,
      this.rejectedDate,
      this.status});

  Content.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    customerId = json['customer_id'];
    customerName = json['customer_name'];
    deliveryAddress = json['delivery_address'];
    store = json['store'] != null ? new Store.fromJson(json['store']) : null;
    staffId = json['staff_id'];
    staffName = json['staff_name'];
    createDate = json['create_date'];
    if (json['product_list'] != null) {
      productList = <ProductList>[];
      json['product_list'].forEach((v) {
        productList!.add(new ProductList.fromJson(v));
      });
    }
    totalPrice = json['total_price'];
    totalPriceAfterDiscount = json['total_price_after_discount'];
    paymentMethod = json['payment_method'];
    orderType = json['order_type'];
    approvalDate = json['approval_date'];
    packagedDate = json['packaged_date'];
    deliveryDate = json['delivery_date'];
    receivedDate = json['received_date'];
    rejectedDate = json['rejected_date'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['customer_id'] = this.customerId;
    data['customer_name'] = this.customerName;
    data['delivery_address'] = this.deliveryAddress;
    if (this.store != null) {
      data['store'] = this.store!.toJson();
    }
    data['staff_id'] = this.staffId;
    data['staff_name'] = this.staffName;
    data['create_date'] = this.createDate;
    if (this.productList != null) {
      data['product_list'] = this.productList!.map((v) => v.toJson()).toList();
    }
    data['total_price'] = this.totalPrice;
    data['total_price_after_discount'] = this.totalPriceAfterDiscount;
    data['payment_method'] = this.paymentMethod;
    data['order_type'] = this.orderType;
    data['approval_date'] = this.approvalDate;
    data['packaged_date'] = this.packagedDate;
    data['delivery_date'] = this.deliveryDate;
    data['received_date'] = this.receivedDate;
    data['rejected_date'] = this.rejectedDate;
    data['status'] = this.status;
    return data;
  }
}

class Store {
  int? storeId;
  String? storeAddress;
  String? storePhone;
  bool? status;

  Store({this.storeId, this.storeAddress, this.storePhone, this.status});

  Store.fromJson(Map<String, dynamic> json) {
    storeId = json['store_id'];
    storeAddress = json['store_address'];
    storePhone = json['store_phone'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['store_id'] = this.storeId;
    data['store_address'] = this.storeAddress;
    data['store_phone'] = this.storePhone;
    data['status'] = this.status;
    return data;
  }
}

class ProductList {
  int? productDetailId;
  int? productId;
  String? productName;
  String? category;
  String? colour;
  String? size;
  String? productImageUrl;
  double? pricePerOne;
  double? price;
  Null? discountPricePerOne;
  Null? discountPrice;
  int? quantity;

  ProductList(
      {this.productDetailId,
      this.productId,
      this.productName,
      this.category,
      this.colour,
      this.size,
      this.productImageUrl,
      this.pricePerOne,
      this.price,
      this.discountPricePerOne,
      this.discountPrice,
      this.quantity});

  ProductList.fromJson(Map<String, dynamic> json) {
    productDetailId = json['product_detail_id'];
    productId = json['product_id'];
    productName = json['product_name'];
    category = json['category'];
    colour = json['colour'];
    size = json['size'];
    productImageUrl = json['product_image_url'];
    pricePerOne = json['price_per_one'];
    price = json['price'];
    discountPricePerOne = json['discount_price_per_one'];
    discountPrice = json['discount_price'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_detail_id'] = this.productDetailId;
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['category'] = this.category;
    data['colour'] = this.colour;
    data['size'] = this.size;
    data['product_image_url'] = this.productImageUrl;
    data['price_per_one'] = this.pricePerOne;
    data['price'] = this.price;
    data['discount_price_per_one'] = this.discountPricePerOne;
    data['discount_price'] = this.discountPrice;
    data['quantity'] = this.quantity;
    return data;
  }
}