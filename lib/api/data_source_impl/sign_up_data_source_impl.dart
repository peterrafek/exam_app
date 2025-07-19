import 'package:injectable/injectable.dart';

import '../../data/data_source/sign_up_data_source.dart';
import '../api_client.dart';
import '../model/request/sign_up_request.dart';
import '../model/response/sign_up_response.dart';
@Injectable(as: SignUpDataSource)
class SignUpDataSourceImpl extends SignUpDataSource{
  ApiClient apiClient;
  SignUpDataSourceImpl (this.apiClient);
   @override
  Future<SignUpResponse> signUp(SignUpRequest request) {
    return apiClient.signUp(request);
  }
}