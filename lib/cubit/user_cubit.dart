import 'package:happy_tech_mastering_api_with_flutter/repo/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_tech_mastering_api_with_flutter/cubit/user_state.dart';
import 'package:happy_tech_mastering_api_with_flutter/model/sign_in_model.dart';
import 'package:image_picker/image_picker.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository userRepository;
  UserCubit(this.userRepository) : super(SignInInitial());
  //Sign in Form key
  GlobalKey<FormState> signInFormKey = GlobalKey();
  //Sign in email
  TextEditingController signInEmail = TextEditingController();
  //Sign in password
  TextEditingController signInPassword = TextEditingController();
  //Sign Up Form key
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  //Profile Pic
  XFile? profilePic;
  //Sign up name
  TextEditingController signUpName = TextEditingController();
  //Sign up phone number
  TextEditingController signUpPhoneNumber = TextEditingController();
  //Sign up email
  TextEditingController signUpEmail = TextEditingController();
  //Sign up password
  TextEditingController signUpPassword = TextEditingController();
  //Sign up confirm password
  TextEditingController confirmPassword = TextEditingController();

  /// function to signIn
  SignInModel? user;
  signIn() async {
    emit(SignInLoading());
    final response = await userRepository.signIn(
        email: signInEmail.text, password: signInPassword.text);
    response.fold((errMessage) => emit(SignInFailure(errorMessage: errMessage)),
        (signInModel) => emit(SignInSuccess()));
  }

  uploadProfilePic(XFile image) async {
    profilePic = image;
    emit(UpdateProfile());
  }

  signUP() async {
    emit(SignUpLoading());
    final response = await userRepository.signUp(
        name: signUpName.text,
        phone: signUpPhoneNumber.text,
        email: signUpEmail.text,
        password: signUpPassword.text,
        confirmPassword: confirmPassword.text,
        profilePic: profilePic!);

    response.fold(
      (errMessage) => emit(SignUpFailure(errorMessage: errMessage)),
      (signUpModel) => emit(SignUpSuccess(message: signUpModel.message)));
  }

  getUserProfile() async {
    emit(GetUserLoading());
    final response = await userRepository.getUserProfile();
    response.fold((errMessage) => emit(GetUserFailure(errMessage: errMessage)),
        (userModel) => emit(GetUserSuccess(user: userModel)));
  }
}
