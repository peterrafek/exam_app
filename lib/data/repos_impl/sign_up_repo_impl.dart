import 'package:exam_app/domain/repos/sign_up_repo.dart';
import 'package:injectable/injectable.dart';

import '../../api/model/request/sign_up_request.dart';
import '../../api/model/response/sign_up_response.dart';
import '../data_source/sign_up_data_source.dart';
 @Injectable(as: SignUpRepo)
class SignUpRepoImpl extends SignUpRepo{
 SignUpDataSource dataSource;
  SignUpRepoImpl(this.dataSource);
  @override
  Future<SignUpResponse> signUp(SignUpRequest request) {
    return dataSource.signUp(request);
   }

}