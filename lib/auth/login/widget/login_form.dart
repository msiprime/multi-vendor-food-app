import 'dart:developer';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:form_fields/form_fields.dart';

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
            _buildEmailFormField(),
            const SizedBox(height: AppSpacing.sm),
            _buildPasswordFormField(),
            const SizedBox(height: AppSpacing.lg),
            _buildLoginButton(),
          ],
        ),
      ),
    );
  }

  ShadButton _buildLoginButton() {
    return ShadButton(
      width: double.infinity,
      onPressed: () {
        if (!(_formKey.currentState?.saveAndValidate() ?? false)) {
          return;
        }
        final email = _formKey.currentState?.value['email'] as String;
        final password = _formKey.currentState?.value['password'] as String;

        log('Email: $email, Password: $password');
      },
      child: const Text('Login'),
    );
  }

  ValueListenableBuilder<bool> _buildPasswordFormField() {
    return ValueListenableBuilder(
      valueListenable: _isObscured,
      child: const Padding(
        padding: EdgeInsets.all(AppSpacing.sm),
        child: ShadImage.square(LucideIcons.lock, size: AppSpacing.lg),
      ),
      builder: (context, obscure, prefix) => ShadInputFormField(
        obscureText: obscure,
        id: 'password',
        label: const Text('Password'),
        placeholder: const Text('Enter your password'),
        prefix: prefix,
        suffix: ShadButton.secondary(
          onPressed: () => _isObscured.value = !_isObscured.value,
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
        validator: (value) {
          final password = Password.dirty(value);
          return password.errorMessage;
        },
      ),
    );
  }

  ShadInputFormField _buildEmailFormField() {
    return ShadInputFormField(
      id: 'email',
      label: const Text('Email'),
      placeholder: const Text('Enter your email'),
      prefix: const Padding(
        padding: EdgeInsets.all(AppSpacing.sm),
        child: ShadImage.square(LucideIcons.mail, size: AppSpacing.lg),
      ),
      validator: (value) {
        final email = Email.dirty(value);
        return email.errorMessage;
      },
    );
  }
}
