import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_vendor_food_app/auth/cubit/auth_cubit.dart';
import 'package:multi_vendor_food_app/auth/login/view/login_page.dart';
import 'package:multi_vendor_food_app/auth/sign_up/view/sign_up_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(),
      child: const AuthView(),
    );
  }
}

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    final showLogin = context.select((AuthCubit cubit) => cubit.state);
    return PageTransitionSwitcher(
      reverse: showLogin,
      transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
        return SharedAxisTransition(
          animation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.horizontal,
          child: child,
        );
      },
      child: showLogin ? const LoginPage() : const SignUpPage(),
    );
  }
}
