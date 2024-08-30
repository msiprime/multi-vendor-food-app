import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_vendor_food_app/auth/auth.dart';
import 'package:multi_vendor_food_app/auth/login/widget/welcome_image.dart';
import 'package:multi_vendor_food_app/auth/sign_up/widgets/sign_up_footer.dart';
import 'package:multi_vendor_food_app/auth/sign_up/widgets/sign_up_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SignUpView();
  }
}

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      resizeToAvoidBottomInset: true,
      releaseFocus: true,
      body: AppConstrainedScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.md,
        ),
        child: Column(
          children: [
            const WelcomeImage(),
            const SizedBox(height: AppSpacing.lg),
            const SignUpForm(),
            const SizedBox(height: AppSpacing.md),
            const Spacer(),
            SignUpFooter(
              text: 'Sign in',
              onTap: () =>
                  context.read<AuthCubit>().changeAuth(showLogin: true),
            ),
          ],
        ),
      ),
    );
  }
}
