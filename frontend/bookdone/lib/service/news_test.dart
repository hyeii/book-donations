import 'package:bookdone/service/rest_client.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'news_test.g.dart';

@RestApi(baseUrl: 'https://hacker-news.firebaseio.com/v0')
abstract class HackerNewsRepository {
  factory HackerNewsRepository(Dio dio, {String? baseUrl}) =
      _HackerNewsRepository;

  @GET('/topstories.json')
  Future<List<int>> getTopNews();

  @GET('/item/{id}.json')
  Future<RestClient> getNewsModelDetail(@Path() int id);
}
