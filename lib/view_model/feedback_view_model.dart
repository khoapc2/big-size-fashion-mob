import 'package:shop_app/api/api_feedback.dart';
import 'package:shop_app/models/create_feedback_request_model.dart';
import 'package:shop_app/models/create_feedback_response_model.dart';
import 'package:shop_app/models/get_list_feedback_model.dart';
import 'package:shop_app/models/rating_response_model.dart';

class FeedbackViewModel{
   Future<CreateFeedbackResponse?> createFeedback(CreateFeedbackRequest request, String token)
  async {
    FeedbackService services = new FeedbackService();
    try {
      return await services.createFeedback(request, token);
    } catch (Exception) {
      print("lỗi nè:"+Exception.toString());
    }
  }

  static Future<RatingResponse> getRating(int productId) async {
    FeedbackService service = new FeedbackService();
    var result = await service.getRating(productId);
    return result;
  }

  static Future<GetListFeedback> getListFeedback(int page, int productId) async {
    FeedbackService service = new FeedbackService();
    var result = await service.getListFeedback(page, productId);
    return result;
  }
}