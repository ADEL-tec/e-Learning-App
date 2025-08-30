import 'package:flutter_bloc/flutter_bloc.dart';

import 'register/bloc/register_bloc.dart';
import 'signin/bloc/sign_in_bloc.dart';
import 'welcome/bloc/welcome_bloc.dart';

class AppBlocProviders {
  static final allBlocProviders = [
    BlocProvider<WelcomeBloc>(create: (context) => WelcomeBloc()),
    BlocProvider<SignInBloc>(create: (context) => SignInBloc()),
    BlocProvider<RegisterBloc>(create: (context) => RegisterBloc()),
  ];
}
