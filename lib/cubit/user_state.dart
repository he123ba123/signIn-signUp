import 'package:happy_tech_mastering_api_with_flutter/model/user_model.dart';

class UserState {}

final class SignInInitial extends UserState {}

final class SignInLoading extends UserState {}

final class SignInSuccess extends UserState {}

final class SignInFailure extends UserState {
  final String errorMessage;
  SignInFailure({required this.errorMessage});
}

final class UpdateProfile extends UserState {}

final class SignUpInitial extends UserState {}

final class SignUpLoading extends UserState {}

final class SignUpSuccess extends UserState {
  final String message;
  SignUpSuccess({required this.message});
}
final class SignUpFailure extends UserState {
  final String errorMessage;
  SignUpFailure({required this.errorMessage});
}
final class GetUserSuccess extends UserState {
  final UserModel user;

  GetUserSuccess({required this.user});
}

final class GetUserLoading extends UserState {}

final class GetUserFailure extends UserState {
  final String errMessage;

  GetUserFailure({required this.errMessage});
}