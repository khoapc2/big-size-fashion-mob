class PaymentResquest {
  int? deliveryAddress;
  double? totalPrice;
  double? promotionPrice;
  bool? orderType;
  String? paymentMethod;

  PaymentResquest(
      {this.deliveryAddress,
      this.totalPrice,
      this.promotionPrice,
      this.orderType,
      this.paymentMethod});

  PaymentResquest.fromJson(Map<String, dynamic> json) {
    deliveryAddress = json['delivery_address'];
    totalPrice = json['total_price'];
    promotionPrice = json['promotion_price'];
    orderType = json['order_type'];
    paymentMethod = json['payment_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['delivery_address'] = this.deliveryAddress;
    data['total_price'] = this.totalPrice;
    data['promotion_price'] = this.promotionPrice;
    data['order_type'] = this.orderType;
    data['payment_method'] = this.paymentMethod;
    return data;
  }
}