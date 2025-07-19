
import '../../../../api/model/response/sign_up_response.dart';

sealed class SignUpStates{}
class SignUpInitial extends SignUpStates {}

class SignUpLoading extends SignUpStates {}

class SignUpSuccess extends SignUpStates {
  final SignUpResponse response;
  SignUpSuccess(this.response);
}

class SignUpFailure extends SignUpStates {
  final String error;
  SignUpFailure(this.error);
}