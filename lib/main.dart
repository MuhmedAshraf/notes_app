import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Core/helper/api_helper/api_consumer.dart';
import 'package:notes_app/Core/helper/api_helper/dio_consumer.dart';
import 'package:notes_app/Core/helper/cache_helper/cache_helper.dart';
import 'package:notes_app/Features/01.auth/presentation/controller/cubit/user_cubit.dart';
import 'package:notes_app/Features/01.auth/presentation/views/welcome_screen.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(
    BlocProvider(
      create: (context) => UserCubit(api: DioConsumer(dio: Dio())),
      child: const Notes(),
    ),
  );
}

class Notes extends StatelessWidget {
  const Notes({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
