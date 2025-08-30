import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/widgets/flutter_toast.dart';
import 'bloc/register_bloc.dart';

class RegisterController {
  final BuildContext context;

  RegisterController({required this.context});

  void handleEmailRegister() async {
    final state = context.read<RegisterBloc>().state;
    String username = state.username;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (username.isEmpty) {
      toastInfo(msg: "User can not be empty");
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: "Email can not be empty");
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: "Password can not be empty");
      return;
    }
    if (rePassword.isEmpty) {
      toastInfo(msg: "Your password confirmation is wrong");
      return;
    }

    try {
      final credentials = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (credentials.user != null) {
        await credentials.user!.sendEmailVerification();
        await credentials.user!.updateDisplayName(username);
        String photoUrl = "uploads/default.png";
        await credentials.user!.updatePhotoURL(photoUrl);
        toastInfo(
          msg:
              "An email hase been send in your register email to activate it, pleasee check your email box and click on the link",
        );
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        toastInfo(msg: "The password provide is to weeak");
      } else if (e.code == "email-already-in-use") {
        toastInfo(msg: "The email already in use");
      } else if (e.code == "invalid email") {
        toastInfo(msg: "Your email id is invalid");
      }
    }
  }
}
