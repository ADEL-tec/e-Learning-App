import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/routes/routes.dart';
import '../widgets/auth_btn.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/forgot_pass.dart';
import '../widgets/light_text.dart';
import '../widgets/my_text_field.dart';
import '../widgets/third_party_auth.dart';
import 'bloc/sign_in_bloc.dart';
import 'sign_in_controller.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Log in"),
      body: BlocProvider(
        create: (context) => SignInBloc(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ThirdPartyAuth(),
                Center(child: LightText('Or use your email to login')),
                Container(
                  margin: EdgeInsets.only(top: 40.h),
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LightText("Email"),
                      SizedBox(height: 5.h),
                      MyTextField(
                        onChanged: (value) {
                          context.read<SignInBloc>().add(
                            SignInEmailEvent(email: value),
                          );
                        },
                        text: "Email",
                        textType: TextInputType.emailAddress,
                        iconName: "user",
                        hintText: "Enter your email address",
                      ),
                      LightText("Password"),
                      SizedBox(height: 5.h),
                      MyTextField(
                        onChanged: (value) {
                          context.read<SignInBloc>().add(
                            SignInPasswordEvent(password: value),
                          );
                        },
                        text: "Password",
                        textType: TextInputType.visiblePassword,
                        iconName: "lock",
                        hintText: "Enter your password",
                      ),
                    ],
                  ),
                ),
                ForgotPass(),
                AuthBtn(
                  text: "Log In",
                  btnType: AuthType.login,
                  onTap: () {
                    print("login btn");
                    SignInController(
                      context: context,
                    ).handleSignIn(AuthType.login);
                  },
                ),
                AuthBtn(
                  text: "Register",
                  btnType: AuthType.register,
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.register);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
