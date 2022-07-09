class CreateFeedbackResponse {
  Content? content;
  Null? error;
  bool? isSuccess;
  String? responseTime;

  CreateFeedbackResponse(
      {this.content, this.error, this.isSuccess, this.responseTime});

  CreateFeedbackResponse.fromJson(Map<String, dynamic> json) {
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
  int? feedbackId;
  Null? customerName;
  String? content;
  int? rate;
  String? createDate;

  Content(
      {this.feedbackId,
      this.customerName,
      this.content,
      this.rate,
      this.createDate});

  Content.fromJson(Map<String, dynamic> json) {
    feedbackId = json['feedback_id'];
    customerName = json['customer_name'];
    content = json['content'];
    rate = json['rate'];
    createDate = json['create_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['feedback_id'] = this.feedbackId;
    data['customer_name'] = this.customerName;
    data['content'] = this.content;
    data['rate'] = this.rate;
    data['create_date'] = this.createDate;
    return data;
  }
}