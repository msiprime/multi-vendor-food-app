import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late GlobalKey<ShadFormState> _formKey;
  late ValueNotifier<bool> _isObscured;

  @override
  void initState() {
    _formKey = GlobalKey<ShadFormState>();
    _isObscured = ValueNotifier<bool>(true);
    super.initState();
  }

  @override
  void dispose() {
    _isObscured.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ShadForm(
      key: _formKey,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 350,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ShadInputFormField(
              id: 'email',
              label: const Text('Email'),
              placeholder: const Text('Enter your email'),
              prefix: const Padding(
                padding: EdgeInsets.all(AppSpacing.sm),
                child: ShadImage.square(LucideIcons.mail, size: AppSpacing.lg),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            ValueListenableBuilder(
              valueListenable: _isObscured,
              builder: (context, obscure, child) => ShadInputFormField(
                obscureText: obscure,
                id: 'password',
                label: const Text('Password'),
                placeholder: const Text('Enter your password'),
                prefix: const Padding(
                  padding: EdgeInsets.all(AppSpacing.sm),
                  child:
                      ShadImage.square(LucideIcons.lock, size: AppSpacing.lg),
                ),
                suffix: ShadButton.secondary(
                  onPressed: () {
                    _isObscured.value = !_isObscured.value;
                  },
                  width: AppSpacing.xlg + AppSpacing.sm,
                  height: AppSpacing.xlg + AppSpacing.sm,
                  padding: EdgeInsets.zero,
                  decoration: const ShadDecoration(
                    secondaryBorder: ShadBorder.none,
                    secondaryFocusedBorder: ShadBorder.none,
                  ),
                  icon: ShadImage.square(
                    obscure ? LucideIcons.eyeOff : LucideIcons.eye,
                    size: AppSpacing.lg,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
