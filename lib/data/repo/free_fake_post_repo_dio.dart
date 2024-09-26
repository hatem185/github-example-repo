import 'package:dio/dio.dart';
import 'package:search_items_screen/core/api_endpoint.dart';
import 'package:search_items_screen/data/model/free_fake_post_model.dart';

class FreeFakePostRepoDio {
  final Dio client;

  FreeFakePostRepoDio({required this.client});

  Future<List<FreeFakePostModel>> fetchPosts() async {
    try {
      final response = await client.get(ApiEndpoint.freeFakePosts);
      final List responseData = response.data;
      final result = responseData.map((e) {
        return FreeFakePostModel.fromJson(e);
      }).toList();
      return result;
    } on DioException catch (e) {
      print(e.message);
      print(e.stackTrace);
      return [];
    } catch (e, s) {
      print(e);
      print(s);
      return [];
    }
  }

  Future<FreeFakePostModel?> createPost(Map<String, dynamic> data) async {
    try {
      final response = await client.post(
        ApiEndpoint.freeFakePosts,
        data: data,
      );
      final Map<String, dynamic> responseData = response.data;
      print("response of created post: ${responseData}");
      return FreeFakePostModel.fromJson(responseData);
    } on DioException catch (e) {
      print(e.message);
      print(e.stackTrace);
      return null;
    } catch (e, s) {
      print(e);
      print(s);
      return null;
    }
  }
}
