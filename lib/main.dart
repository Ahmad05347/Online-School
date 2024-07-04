import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learning/common/routes/pages.dart';
import 'package:u_learning/global.dart';

Future<void> main() async {
  // ignore: await_only_futures
  WidgetsFlutterBinding.ensureInitialized();
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => MaterialApp(
          builder: EasyLoading.init(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: true),
          //  home: const ApplicationPages(),
          onGenerateRoute: AppPages.GenerateRouteSettings,
          // initialRoute: "/",
          // routes: {
          //   "HomePage": (context) => const HomePage(),
          //   "signInPage": (context) => const SignIn(),
          //   "register": (context) => const RegisterPage(),
          // },
        ),
      ),
    );
  }
}
