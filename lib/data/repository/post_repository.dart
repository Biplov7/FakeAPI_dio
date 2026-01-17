import 'package:dio/dio.dart';
import 'package:weather/data/models/post_model.dart';
import 'package:weather/data/repository/api/api.dart';

class PostRepository {
  Api api = Api();
  Future<List<PostModel>> fetchPost() async {
    try {
      Response response = await api.sendRequest.get("/posts");
      List<dynamic> postMap = response.data;
      return postMap.map((postMap) {
        return PostModel.fromJson(postMap);
      }).toList();
    } catch (e) {
      rethrow;
    }
  }
}
