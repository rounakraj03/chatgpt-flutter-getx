import 'package:dio/dio.dart';

class JokeRepository {
  late Dio dio;
  String apiUrl = "https://icanhazdadjoke.com/";

  JokeRepository() {
    dio = Dio();
  }

  Future<String> getJokes() async {
    final response = await dio.get(apiUrl,
        options: Options(headers: {
          'Accept': 'application/json',
        }));
    return response.data['joke'];
  }
}
