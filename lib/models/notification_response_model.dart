class NotificationResponse {
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

  NotificationResponse(
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

  NotificationResponse.fromJson(Map<String, dynamic> json) {
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
  int? notificationId;
  String? title;
  String? message;
  Null? referenceUrl;
  String? createDate;

  Content(
      {this.notificationId,
      this.title,
      this.message,
      this.referenceUrl,
      this.createDate});

  Content.fromJson(Map<String, dynamic> json) {
    notificationId = json['notification_id'];
    title = json['title'];
    message = json['message'];
    referenceUrl = json['reference_url'];
    createDate = json['create_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notification_id'] = this.notificationId;
    data['title'] = this.title;
    data['message'] = this.message;
    data['reference_url'] = this.referenceUrl;
    data['create_date'] = this.createDate;
    return data;
  }
}