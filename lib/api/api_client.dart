import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'model/request/sign_up_request.dart';
import 'model/response/sign_up_response.dart';


part 'api_client.g.dart';

@injectable
@RestApi()
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;


  @POST("/v1/auth/signup")
  Future<SignUpResponse> signUp(@Body() SignUpRequest request);

}
