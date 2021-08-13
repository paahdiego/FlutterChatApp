import 'package:flutter/material.dart';
import 'package:flutter_chat_app/shared/components/primary_button.dart';
import 'package:flutter_chat_app/shared/config/app_sizes.dart';
import 'package:flutter_chat_app/theme/app_images.dart';

class SignInOrSignUpPage extends StatelessWidget {
  const SignInOrSignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizes = AppSizes(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: sizes.defaultHorizontalPadding,
          child: Column(
            children: [
              Spacer(flex: 2),
              Image.asset(
                sizes.mediaQuery.platformBrightness == Brightness.light
                    ? AppImages.logoLight
                    : AppImages.logoDark,
                height: 146,
              ),
              Spacer(),
              PrimaryButton(
                  text: "Sign In",
                  press: () => Navigator.pushNamed(context, "/chats")),
              SizedBox(height: sizes.defaultPaddingValue * 1.5),
              PrimaryButton(
                text: "Sign up",
                press: () {},
                color: Theme.of(context).colorScheme.secondary,
              ),
              Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
