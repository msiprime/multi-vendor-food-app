import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:multi_vendor_food_app/auth/login/login.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp.material(
      title: 'Multi Vendor Food App',
      themeMode: ThemeMode.light,
      theme: const AppTheme().theme,
      darkTheme: const AppDarkTheme().theme,
      materialThemeBuilder: (context, theme) {
        return theme.copyWith(
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            },
          ),
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            surfaceTintColor: Colors.transparent,
          ),
          snackBarTheme: const SnackBarThemeData(
            behavior: SnackBarBehavior.floating,
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
          ),
          textTheme: theme.brightness == Brightness.light
              ? const AppTheme().textTheme
              : const AppDarkTheme().textTheme,
        );
      },
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}
