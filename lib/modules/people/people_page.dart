import 'package:flutter/material.dart';

import 'package:flutter_chat_app/modules/home/controllers/home_controller.dart';

class PeoplePage extends StatefulWidget {
  const PeoplePage({
    Key? key,
    required this.homeController,
  }) : super(key: key);

  final HomeController homeController;

  @override
  _PeoplePageState createState() => _PeoplePageState();
}

class _PeoplePageState extends State<PeoplePage> {
  @override
  void initState() {
    widget.homeController.loadPeople();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: CircleAvatar(
          backgroundImage:
              NetworkImage(widget.homeController.people[index].avatarUrl!),
        ),
        title: Text(widget.homeController.people[index].name!),
        onTap: () {
          print(widget.homeController.people[index].name!);
        },
      ),
      itemCount: widget.homeController.people.length,
    );
  }
}
