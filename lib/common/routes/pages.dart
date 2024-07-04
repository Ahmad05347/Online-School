import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning/common/routes/routes.dart';
import 'package:u_learning/global.dart';
import 'package:u_learning/home/bloc/homepage_blocs.dart';
import 'package:u_learning/home/homepage.dart';
import 'package:u_learning/pages/application/application_page.dart';
import 'package:u_learning/pages/application/bloc/app_blocs.dart';
import 'package:u_learning/pages/profile/settings/bloc/settings_blocs.dart';
import 'package:u_learning/pages/profile/settings/settings_page.dart';
import 'package:u_learning/pages/register/bloc/register_blocs.dart';
import 'package:u_learning/pages/register/register_page.dart';
import 'package:u_learning/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:u_learning/pages/sign_in/sign_in.dart';
import 'package:u_learning/pages/welcome/bloc/welcome_blocs.dart';
import 'package:u_learning/pages/welcome/welcome.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.INITIAL,
        page: const Welcome(),
        bloc: BlocProvider(
          create: (_) => WelcomeBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.SIGNIN,
        page: const SignIn(),
        bloc: BlocProvider(
          create: (_) => SignInBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.REGISTER,
        page: const RegisterPage(),
        bloc: BlocProvider(
          create: (_) => RegisterBlocs(),
        ),
      ),
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: const ApplicationPages(),
        bloc: BlocProvider(
          create: (_) => AppBlocs(),
        ),
      ),
      PageEntity(
        route: AppRoutes.HOMEPAGE,
        page: const HomePage(),
        bloc: BlocProvider(
          create: (_) => HomePageBlocs(),
        ),
      ),
      PageEntity(
        route: AppRoutes.SETTINGSPAGE,
        page: const SettingsPage(),
        bloc: BlocProvider(
          create: (_) => SettingsBlocs(),
        ),
      ),
    ];
  }

  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes().where((element) => element.route == settings.name);

      if (result.isNotEmpty) {
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if (result.first.route == AppRoutes.INITIAL && deviceFirstOpen) {
          bool isLoggedIn = Global.storageService.getIsLoggedIn();
          if (isLoggedIn) {
            return MaterialPageRoute(
                builder: (_) => const ApplicationPages(), settings: settings);
          }

          return MaterialPageRoute(
              builder: (_) => const SignIn(), settings: settings);
        }

        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    return MaterialPageRoute(
        builder: (_) => const SignIn(), settings: settings);
  }
}

// unify bloc provider, router and pages
class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, this.bloc});
}
