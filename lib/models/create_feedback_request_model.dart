class CreateFeedbackRequest {
  int? productId;
  String? content;
  int? rate;

  CreateFeedbackRequest({this.productId, this.content, this.rate});

  CreateFeedbackRequest.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    content = json['content'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['content'] = this.content;
    data['rate'] = this.rate;
    return data;
  }
}