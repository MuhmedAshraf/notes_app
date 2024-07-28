import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Core/widgets/loading_widget.dart';
import 'package:notes_app/Features/01.auth/presentation/controller/cubit/user_state.dart';
import 'package:notes_app/Features/01.auth/presentation/views/widgets/custom_form_button.dart';
import 'package:notes_app/Features/01.auth/presentation/views/widgets/custom_input_field.dart';
import 'package:notes_app/Features/01.auth/presentation/views/widgets/dont_have_an_account.dart';
import 'package:notes_app/Features/01.auth/presentation/views/widgets/forget_password_widget.dart';
import 'package:notes_app/Features/01.auth/presentation/views/widgets/page_header.dart';
import 'package:notes_app/Features/01.auth/presentation/views/widgets/page_heading.dart';
import '../controller/cubit/user_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffEEF1F3),
        body: Column(
          children: [
            PageHeader(),
            BlocConsumer<UserCubit, UserState>(
              listener: (context, state) {
                if(state is SignInFailure){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errMessage)));
                }
                else if (state is SignInSuccess){
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
                        key: context.read<UserCubit>().signInFormKey,
                        child: Column(
                          children: [
                            const PageHeading(title: 'Sign-in'),
                            //!Email
                            CustomInputField(
                              labelText: 'Email',
                              hintText: 'Your email',
                              controller: context.read<UserCubit>().signInEmail,
                            ),
                            const SizedBox(height: 16),
                            //!Password
                            CustomInputField(
                              labelText: 'Password',
                              hintText: 'Your password',
                              obscureText: true,
                              suffixIcon: true,
                              controller:
                                  context.read<UserCubit>().signInPassword,
                            ),
                            const SizedBox(height: 16),
                            //! Forget password?
                            ForgetPasswordWidget(size: size),
                            const SizedBox(height: 20),
                            //!Sign In Button
                           state is SignInLoading ? const CustomLoadingWidget(): CustomFormButton(
                              innerText: 'Sign In',
                              onPressed: () {
                                context.read<UserCubit>().signIn();
                              },
                            ),
                            const SizedBox(height: 18),
                            //! Dont Have An Account ?
                            DontHaveAnAccountWidget(size: size),
                            const SizedBox(height: 20),
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
