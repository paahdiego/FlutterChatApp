import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chat_app/modules/login/controllers/login_controller.dart';
import 'package:flutter_chat_app/shared/config/app_sizes.dart';
import 'package:flutter_chat_app/theme/theme.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginController = LoginController();

  bool invisiblePassword = true;
  IconData invisiblePasswordIcon = Icons.visibility_off_outlined;

  @override
  void initState() {
    super.initState();
    loginController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final sizes = AppSizes(context);

    return Container(
      width: sizes.displayHeight,
      height: sizes.displayHeight,
      child: Scaffold(
        body: SafeArea(
          child: Form(
            key: loginController.formKey,
            child: SingleChildScrollView(
              child: Container(
                height: sizes.safeHeight,
                width: sizes.displayWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FlutterLogo(
                      size: sizes.displayWidth * 0.6,
                    ),
                    SizedBox(height: sizes.defaultPaddingValue * 4),
                    Container(
                      width: sizes.displayWidth * 0.8,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: "E-mail",
                            ),
                            controller: loginController.emailController,
                            textInputAction: TextInputAction.next,
                            inputFormatters: [LowerCaseTextFormatter()],
                            keyboardType: TextInputType.emailAddress,
                            validator: Validatorless.multiple(
                              [
                                Validatorless.email("digite um e-mail válido"),
                                Validatorless.required(
                                    "digite uma e-mail válida"),
                              ],
                            ),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: "Senha",
                              suffixIcon: IconButton(
                                  splashColor: AppColors.transparent,
                                  icon: Icon(
                                    invisiblePasswordIcon,
                                    color: invisiblePassword
                                        ? AppColors.kPrimaryColor
                                            .withOpacity(0.3)
                                        : AppColors.kPrimaryColor,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      invisiblePassword = !invisiblePassword;
                                      if (invisiblePassword) {
                                        invisiblePasswordIcon =
                                            Icons.visibility_off_outlined;
                                      } else {
                                        invisiblePasswordIcon =
                                            Icons.visibility_outlined;
                                      }
                                    });
                                  }),
                            ),
                            controller: loginController.passController,
                            obscureText: invisiblePassword,
                            onFieldSubmitted: (_) async {
                              await loginController.login(context: context);
                            },
                            keyboardType: TextInputType.visiblePassword,
                            validator: Validatorless.multiple(
                              [
                                Validatorless.required(
                                    "digite uma senha válida"),
                              ],
                            ),
                          ),
                          SizedBox(height: sizes.defaultPaddingValue * 2),
                          TextButton(
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0.0),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: sizes.defaultBorderRadius),
                              ),
                              padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 40),
                              ),
                              overlayColor: MaterialStateProperty.all(
                                  AppColors.kPrimaryColor),
                              backgroundColor: MaterialStateProperty.all(
                                  AppColors.kPrimaryColor),
                              foregroundColor:
                                  MaterialStateProperty.all(AppColors.white),
                            ),
                            onPressed: () async {
                              await loginController.login(context: context);
                            },
                            child: loginController.state != LoginState.loading
                                ? Text(
                                    "Login",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(color: Colors.white),
                                  )
                                : CircularProgressIndicator(),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LowerCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toLowerCase(),
      selection: newValue.selection,
    );
  }
}
