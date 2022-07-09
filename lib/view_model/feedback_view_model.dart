import 'package:shop_app/api/api_feedback.dart';
import 'package:shop_app/models/create_feedback_request_model.dart';
import 'package:shop_app/models/create_feedback_response_model.dart';

class FeedbackViewModel{
   Future<CreateFeedbackResponse?> createFeedback(CreateFeedbackRequest request)
  async {
    FeedbackService services = new FeedbackViewModel();
    try {
      return await services.createFeedback(request);
    } catch (Exception) {
      print("lỗi nè:"+Exception.toString());
    }
  }
}