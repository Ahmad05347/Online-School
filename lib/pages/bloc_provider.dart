import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning/pages/register/bloc/register_blocs.dart';
import 'package:u_learning/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:u_learning/pages/welcome/bloc/welcome_blocs.dart';

class AppBlocProvider {
  static get allBlocProvider => [
        BlocProvider(
          lazy: false,
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          create: (context) => SignInBloc(),
        ),
        BlocProvider(
          create: (context) => RegisterBlocs(),
        ),
      ];
}
