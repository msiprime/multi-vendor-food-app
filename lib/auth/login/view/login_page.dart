import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_vendor_food_app/auth/auth.dart';
import 'package:multi_vendor_food_app/auth/login/login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginView();
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      releaseFocus: true,
      body: Center(
        child: AppConstrainedScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.md,
          ),
          child: Column(
            children: [
              WelcomeImage(),
              SizedBox(height: AppSpacing.lg),
              LoginForm(),
              SizedBox(height: AppSpacing.md),
              Spacer(),
              LoginFooter(
                text: 'Sign Up',
                onTap: () =>
                    context.read<AuthCubit>().changeAuth(showLogin: false),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
