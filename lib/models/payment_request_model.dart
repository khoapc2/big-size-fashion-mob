class PaymentResquest {
  int? deliveryAddress;
  double? totalPrice;
  double? totalAfterDiscount;
  double? promotionPrice;
  bool? orderType;
  String? paymentMethod;
  double? shippingFee;
  int? storeId;

  PaymentResquest(
      {this.deliveryAddress,
      this.totalPrice,
      this.totalAfterDiscount,
      this.promotionPrice,
      this.orderType,
      this.paymentMethod,
      this.shippingFee,
      this.storeId});

  PaymentResquest.fromJson(Map<String, dynamic> json) {
    deliveryAddress = json['delivery_address'];
    totalPrice = json['total_price'];
    totalAfterDiscount = json['total_after_discount'];
    promotionPrice = json['promotion_price'];
    orderType = json['order_type'];
    paymentMethod = json['payment_method'];
    shippingFee = json['shipping_fee'];
    storeId = json['store_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['delivery_address'] = this.deliveryAddress;
    data['total_price'] = this.totalPrice;
    data['total_after_discount'] = this.totalAfterDiscount;
    data['promotion_price'] = this.promotionPrice;
    data['order_type'] = this.orderType;
    data['payment_method'] = this.paymentMethod;
    data['shipping_fee'] = this.shippingFee;
    data['store_id'] = this.storeId;
    return data;
  }
}