import 'package:flutter/material.dart';
import 'package:flutter_chat_app/modules/home/controllers/home_controller.dart';
import 'package:flutter_chat_app/shared/auth/auth_controller.dart';
import 'package:flutter_chat_app/shared/components/primary_button.dart';
import 'package:flutter_chat_app/shared/config/app_sizes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    Key? key,
    required this.homeController,
  }) : super(key: key);

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    final sizes = AppSizes(context);
    return Padding(
      padding: sizes.defaultHorizontalPadding,
      child: Column(
        children: [
          Spacer(
            flex: 2,
          ),
          Container(
            width: sizes.displayHeight * 0.15,
            height: sizes.displayHeight * 0.15,
            child: CircleAvatar(
              backgroundImage:
                  NetworkImage(homeController.loggedUser.avatarUrl!),
            ),
          ),
          SizedBox(
            height: sizes.defaultPaddingValue,
          ),
          Container(
            width: sizes.defaultWidgetWidth,
            child: DataTable(
              columnSpacing: sizes.defaultPaddingValue,
              dataTextStyle: Theme.of(context).textTheme.subtitle1,
              columns: [
                DataColumn(label: Container()),
                DataColumn(label: Container()),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text("Nome:")),
                  DataCell(Text(homeController.loggedUser.name!)),
                ]),
                DataRow(cells: [
                  DataCell(Text("E-mail:")),
                  DataCell(Text(homeController.loggedUser.email!)),
                ]),
                DataRow(cells: [
                  DataCell(Text("Telefone:")),
                  DataCell(Text(homeController.loggedUser.phone!)),
                ]),
              ],
            ),
          ),
          Spacer(),
          PrimaryButton(
            text: "Logout",
            press: () {
              final authController = AuthController();
              authController.logout().then(
                    (value) => Navigator.pushReplacementNamed(
                        context, "/welcome-page"),
                  );
            },
          ),
          Spacer(
            flex: 2,
          )
        ],
      ),
    );
  }
}
