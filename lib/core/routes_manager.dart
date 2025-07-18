
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class RoutesManager {
  static const String signUp = '/signUp';

  static const String logIn = '/logIn';
  static const String forgetPassword = '/forgetPassword';
  static const String emailVerification = '/emailVerification';
  static const String resetPassword = '/resetPassword';
  static const String baseTab = '/baseTab';
  static const String exams = '/exams';
  static const String examStart = '/examStart';

  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case logIn:
        return MaterialPageRoute(
          builder: (context) => const LogIn(),
        );
      case signUp:
        return MaterialPageRoute(
          builder: (context) =>   SignUpScreen(),
        );
      case forgetPassword:
        return MaterialPageRoute(
          builder: (context) => const ForgetPassword(),
        );
      case emailVerification:
        final args = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (_) => getIt<ForgetPasswordCubit>(),
            child: EmailVerification(email: args),
          ),
        );
      case resetPassword:
        final args = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<ResetPasswordCubit>(),
            child: ResetPassword(email: args),
          ),
        );
      case baseTab:
        return MaterialPageRoute(
          builder: (context) => const BaseTab(),
        );
      case exams:
        final args = settings.arguments as Subjects;
        return MaterialPageRoute(
          builder: (context) => ExamsPage(item: args),
        );
      case examStart:
        final args = settings.arguments as Exams;
        return MaterialPageRoute(
          builder: (context) => ExamStartPage(item: args,),
        );
    }
  }
}
