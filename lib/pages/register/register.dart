import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/values/color.dart';
import '../widgets/auth_btn.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/light_text.dart';
import '../widgets/my_text_field.dart';
import 'bloc/register_bloc.dart';
import 'register_controller.dart';

class Register extends StatefulWidget {
  static const routeName = 'register';
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: CustomAppBar(title: "Register"),
      body: BlocProvider(
        create: (context) => RegisterBloc(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                Center(
                  child: LightText(
                    'Enter your details bellow and free sign up',
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 40.h),
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LightText("Username"),
                      MyTextField(
                        onChanged: (value) {
                          context.read<RegisterBloc>().add(
                            RegisterUsernameEvent(username: value),
                          );
                        },
                        text: "Username",
                        textType: TextInputType.name,
                        iconName: "user",
                        hintText: "Enter your email username",
                      ),
                      LightText("Email"),
                      MyTextField(
                        onChanged: (value) {
                          context.read<RegisterBloc>().add(
                            RegisterEmailEvent(email: value),
                          );
                        },
                        text: "Email",
                        textType: TextInputType.emailAddress,
                        iconName: "user",
                        hintText: "Enter your email address",
                      ),
                      LightText("Password"),
                      MyTextField(
                        onChanged: (value) {
                          context.read<RegisterBloc>().add(
                            RegisterPasswordEvent(password: value),
                          );
                        },
                        text: "Password",
                        textType: TextInputType.visiblePassword,
                        iconName: "lock",
                        hintText: "Enter your password",
                      ),
                      LightText("Confirm Password"),
                      MyTextField(
                        onChanged: (value) {
                          context.read<RegisterBloc>().add(
                            RegisterRePasswordEvent(rePassword: value),
                          );
                        },
                        text: "Confirm Password",
                        textType: TextInputType.visiblePassword,
                        iconName: "lock",
                        hintText: "Re-enter your password",
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25.w),
                  child: LightText(
                    'By creating an account you have to agree with our term and conditions',
                  ),
                ),
                AuthBtn(
                  text: "Sign Up",
                  btnType: AuthType.login,
                  onTap: () {
                    RegisterController(context: context).handleEmailRegister();
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
