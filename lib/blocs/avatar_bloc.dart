import 'dart:convert';
import 'dart:io';

import 'package:shop_app/models/get_avata_model.dart';
import 'package:shop_app/models/update_avatar_response.model.dart';
import 'package:http/http.dart' as http;

class AvatarBloc {
  final String _baseUrl = "http://bigsizefashion.somee.com/";

  Future<GetAvataResponse> getAvatar(String token) async {
    final response = await http.get(
      Uri.parse(_baseUrl + "api/v1/customers/get-avatar"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token",
      },
    );
    try {
      return GetAvataResponse.fromJson(jsonDecode(response.body));
    } catch (err) {
      return new GetAvataResponse();
    }
  }

  Future<UpdateAvatarResponse> uploadAvatar(String token, File image) async {
    var request = http.MultipartRequest(
        "PUT", Uri.parse(_baseUrl + "api/v1/customers/upload-avatar"));

    //request.fields['title'] = "dummyImage";
    request.headers['Authorization'] = "Bearer $token";

    File file = File(image.path);
    request.files.add(http.MultipartFile(
        'file', file.readAsBytes().asStream(), file.lengthSync(),
        filename: "@" + file.path.split('/').last));

    var response = await request.send();

    var responseData = await response.stream.toBytes();

    var result = String.fromCharCodes(responseData);
    UpdateAvatarResponse avatar = new UpdateAvatarResponse();
    try {
      avatar = UpdateAvatarResponse.fromJson(jsonDecode(result));
      print("Upload avatar api: " + result);
    } catch (err) {
      print(err.toString());
    }

    //print("Upload avatar api 2: " + avatar.toString());
    return avatar;
  }
}
