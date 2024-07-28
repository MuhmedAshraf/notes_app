import 'package:flutter/material.dart';
import 'package:notes_app/Features/01.auth/presentation/views/login_screen.dart';
import 'package:notes_app/Features/01.auth/presentation/views/sign_up_screen.dart';
import 'package:notes_app/Features/01.auth/presentation/views/widgets/custom_form_button.dart';
import 'package:notes_app/Features/01.auth/presentation/views/widgets/page_header.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          const Spacer(flex: 1,),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
            height: size.height * 0.5,
            width: double.infinity,
            child: PageHeader(image: "assets/images/welcome.png"),
          ),
          const Spacer(
            flex: 3,
          ),
          CustomFormButton(
              innerText: 'Log In',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              }),
          const SizedBox(
            height: 30,
          ),
          CustomFormButton(
              innerText: 'Sign Up',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpScreen()));
              }),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
