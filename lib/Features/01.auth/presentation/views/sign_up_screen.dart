import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Core/widgets/loading_widget.dart';
import 'package:notes_app/Features/01.auth/presentation/controller/cubit/user_state.dart';
import 'package:notes_app/Features/01.auth/presentation/views/widgets/already_have_an_account_widget.dart';
import 'package:notes_app/Features/01.auth/presentation/views/widgets/custom_form_button.dart';
import 'package:notes_app/Features/01.auth/presentation/views/widgets/custom_input_field.dart';
import 'package:notes_app/Features/01.auth/presentation/views/widgets/page_header.dart';
import 'package:notes_app/Features/01.auth/presentation/views/widgets/page_heading.dart';
import 'package:notes_app/Features/01.auth/presentation/views/widgets/pick_image_widget.dart';

import '../controller/cubit/user_cubit.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffEEF1F3),
        body: Column(
          children: [
            PageHeader(),
            BlocConsumer<UserCubit, UserState>(
              listener: (context, state) {
                if(state is SignUpFailure){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errMessage)));
                }
                else if(state is SignUpSuccess){
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Success')));
                }
              },
              builder: (context, state) {
                return Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Form(
                        key: context.read<UserCubit>().signUpFormKey,
                        child: Column(
                          children: [
                            const PageHeading(title: 'Sign-up'),
                            //! Name
                            CustomInputField(
                              labelText: 'Name',
                              hintText: 'Your name',
                              isDense: true,
                              controller: context.read<UserCubit>().signUpName,
                            ),
                            const SizedBox(height: 16),
                            //!Email
                            CustomInputField(
                              labelText: 'Email',
                              hintText: 'Your email',
                              isDense: true,
                              controller: context.read<UserCubit>().signUpEmail,
                            ),
                            const SizedBox(height: 16),
                            //! Password
                            CustomInputField(
                              labelText: 'Password',
                              hintText: 'Your password',
                              isDense: true,
                              obscureText: true,
                              suffixIcon: true,
                              controller:
                                  context.read<UserCubit>().signUpPassword,
                            ),
                            //! Confirm Password
                            const SizedBox(height: 22),
                            //!Sign Up Button
                            state is SignUpLoading ? const CustomLoadingWidget():CustomFormButton(
                              innerText: 'Signup',
                              onPressed: () {
                                context.read<UserCubit>().signUp();
                              },
                            ),
                            const SizedBox(height: 18),
                            //! Already have an account widget
                            const AlreadyHaveAnAccountWidget(),
                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
