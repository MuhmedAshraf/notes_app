import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notes_app/Core/helper/api_helper/api_consumer.dart';
import 'package:notes_app/Core/helper/cach_helper/cache_helper.dart';
import 'package:notes_app/Features/01.auth/data/models/UserModel.dart';
import 'package:notes_app/Features/01.auth/presentation/controller/cubit/user_state.dart';

import '../../../../../Core/helper/error/exceptions.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit({required this.api}) : super(UserInitial());

  final ApiConsumer api;

  //Sign in Form key
  GlobalKey<FormState> signInFormKey = GlobalKey();

  //Sign in email
  TextEditingController signInEmail = TextEditingController();

  //Sign in password
  TextEditingController signInPassword = TextEditingController();

  //Sign Up Form key
  GlobalKey<FormState> signUpFormKey = GlobalKey();

  //Sign up name
  TextEditingController signUpName = TextEditingController();

  //Sign up email
  TextEditingController signUpEmail = TextEditingController();

  //Sign up password
  TextEditingController signUpPassword = TextEditingController();

  signIn() async {
    emit(SignInLoading());
    try {
      final response = await api.post(
        '/auth/login',
        data: {
          "email": signInEmail.text,
          "password": signInPassword.text,
        },
      );
      final UserModel user = UserModel.fromJson(response);
      emit(SignInSuccess());
      CacheHelper().saveData(key: "token", value: user.token);
      print(CacheHelper().getData(key: 'token'));
    } on ServerException catch (e) {
      emit(SignInFailure(errMessage: e.errorModel.message));
    }
  }
  signUp()async {
    try {
      emit(SignUpLoading());
      final response = await api.post('/auth/register',data: {
        "email": signUpEmail.text,
        "password": signUpPassword.text,
        "name": signUpName.text,
      });
      final UserModel user = UserModel.fromJson(response);
      emit(SignUpSuccess());
      CacheHelper().saveData(key: "token", value: user.token);
      print(CacheHelper().getData(key: 'token'));
    } on ServerException catch (e) {
    emit(SignUpFailure(errMessage: e.errorModel.message));
    }
  }
}
