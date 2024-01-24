import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../source/model/cat_model.dart';

part 'api_client.g.dart';


@RestApi()
abstract class ApiClient{
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('https://cat-fact.herokuapp.com/facts')
  Future<List<MyModel>> getFacts();
}