class AddOrderResponse {
  Content? content;
  Null? error;
  bool? isSuccess;
  String? responseTime;

  AddOrderResponse(
      {this.content, this.error, this.isSuccess, this.responseTime});

  AddOrderResponse.fromJson(Map<String, dynamic> json) {
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
  int? deliveryAddress;
  int? storeId;
  Null? staffId;
  String? createDate;
  double? totalPrice;
  double? totalPriceAfterDiscount;
  bool? orderType;
  String? paymentMethod;
  Null? approvalDate;
  Null? packagedDate;
  Null? deliveryDate;
  Null? receivedDate;
  Null? rejectedDate;
  int? status;
  double? shippingFee;
  String? zpTransId;

  Content(
      {this.orderId,
      this.customerId,
      this.deliveryAddress,
      this.storeId,
      this.staffId,
      this.createDate,
      this.totalPrice,
      this.totalPriceAfterDiscount,
      this.orderType,
      this.paymentMethod,
      this.approvalDate,
      this.packagedDate,
      this.deliveryDate,
      this.receivedDate,
      this.rejectedDate,
      this.status,
      this.shippingFee,
      this.zpTransId});

  Content.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    customerId = json['customer_id'];
    deliveryAddress = json['delivery_address'];
    storeId = json['store_id'];
    staffId = json['staff_id'];
    createDate = json['create_date'];
    totalPrice = json['total_price'];
    totalPriceAfterDiscount = json['total_price_after_discount'];
    orderType = json['order_type'];
    paymentMethod = json['payment_method'];
    approvalDate = json['approval_date'];
    packagedDate = json['packaged_date'];
    deliveryDate = json['delivery_date'];
    receivedDate = json['received_date'];
    rejectedDate = json['rejected_date'];
    status = json['status'];
    shippingFee = json['shipping_fee'];
    zpTransId = json['zp_trans_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['customer_id'] = this.customerId;
    data['delivery_address'] = this.deliveryAddress;
    data['store_id'] = this.storeId;
    data['staff_id'] = this.staffId;
    data['create_date'] = this.createDate;
    data['total_price'] = this.totalPrice;
    data['total_price_after_discount'] = this.totalPriceAfterDiscount;
    data['order_type'] = this.orderType;
    data['payment_method'] = this.paymentMethod;
    data['approval_date'] = this.approvalDate;
    data['packaged_date'] = this.packagedDate;
    data['delivery_date'] = this.deliveryDate;
    data['received_date'] = this.receivedDate;
    data['rejected_date'] = this.rejectedDate;
    data['status'] = this.status;
    data['shipping_fee'] = this.shippingFee;
    data['zp_trans_id'] = this.zpTransId;
    return data;
  }
}