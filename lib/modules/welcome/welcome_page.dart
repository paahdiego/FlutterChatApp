import 'package:flutter/material.dart';
import 'package:flutter_chat_app/shared/auth/auth_controller.dart';
import 'package:flutter_chat_app/shared/config/app_sizes.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sizes = AppSizes(context);
    final authController = AuthController();
    Future.delayed(Duration(seconds: 2), () {
      authController.isAuthenticated(context);
    });

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Spacer(flex: 2),
            Image.asset("assets/images/welcome_image.png"),
            Spacer(flex: 3),
            Text(
              "Welcome to our freedom \nmessaging app",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Text(
              "Freedom talk any person of your \nmother language.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .color!
                    .withOpacity(0.64),
              ),
            ),
            Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
