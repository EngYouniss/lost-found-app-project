import 'package:dio/dio.dart';

class HttpConnection{
static String url="https://dummyjson.com";

 static Future<List<Map<String, dynamic>>> loadProducts() async {
    Dio dio = Dio();
    Response feedback = await dio.get("$url/products");
    return List<Map<String, dynamic>>.from(feedback.data["products"] ?? []);
  }
}
