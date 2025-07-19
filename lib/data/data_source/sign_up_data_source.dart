
import '../../api/model/request/sign_up_request.dart';
import '../../api/model/response/sign_up_response.dart';

abstract class SignUpDataSource{
  Future<SignUpResponse> signUp(SignUpRequest request);
}