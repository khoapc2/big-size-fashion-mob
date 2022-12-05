import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shop_app/models/create_feedback_request_model.dart';
import 'package:shop_app/models/create_feedback_response_model.dart';
import 'package:shop_app/models/get_list_feedback_model.dart';
import 'package:shop_app/models/rating_response_model.dart';

class FeedbackBloc {
  HttpClient client = HttpClient();
  Future<CreateFeedbackResponse> createFeedback(
      CreateFeedbackRequest request, String token) async {
    // String link = "https://104.215.186.78/";
    CreateFeedbackResponse addToCartResponse;

    String link = "http://bigsizefashion.somee.com/";
    String url = link + "api/v1/feedbacks";

    final response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer " + token
        },
        body: jsonEncode(
          <String, dynamic>{
            'product_id': request.productId,
            'content': request.content,
            'rate': request.rate
          },
        ));

    if (response.statusCode == 200 || response.statusCode == 400) {
      addToCartResponse =
          CreateFeedbackResponse.fromJson(json.decode(response.body));
    } else {
      print("Status code:" + response.statusCode.toString());
      throw Exception(Exception);
    }
    return addToCartResponse;
  }

  Future<RatingResponse> getRating(int productId) async {
    print("getRating");
    String link = "http://bigsizefashion.somee.com/";
    String url = link + "api/v1/feedbacks/rating/" + productId.toString();

    RatingResponse detailProductResponseModel;

    final response = await http.get(Uri.parse(url), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    });

    if (response.statusCode == 200) {
      detailProductResponseModel =
          RatingResponse.fromJson(json.decode(response.body));
    } else {
      detailProductResponseModel = new RatingResponse();
    }
    return detailProductResponseModel;
  }

  Future<GetListFeedback> getListFeedback(int page, int productId) async {
    String link = "http://bigsizefashion.somee.com/";
    String url = link +
        "api/v1/feedbacks/" +
        productId.toString() +
        "?PageNumber=" +
        page.toString();

    GetListFeedback productResponseModel;

    final response = await http.get(Uri.parse(url), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    });

    if (response.statusCode == 200) {
      productResponseModel =
          GetListFeedback.fromJson(json.decode(response.body));
    } else {
      throw Exception(Exception);
    }
    return productResponseModel;
  }
}
