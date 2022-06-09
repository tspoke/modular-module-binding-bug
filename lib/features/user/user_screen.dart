import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_di/features/app/app_service.dart';
import 'package:modular_di/features/user/user_service.dart';

class UserScreen extends StatefulWidget {
  final UserService userService;
  final AppService appService;

  const UserScreen(this.userService, this.appService, {Key? key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text("Instance hash UserService ${widget.userService.hashCode}"),
            Text("Modular.get hash UserService ${Modular.get<UserService>().hashCode}"),
            const Padding(padding: EdgeInsets.only(top: 20)),
            Text("Instance hash AppService ${widget.appService.hashCode}"),
            Text("Modular.get hash AppService ${Modular.get<AppService>().hashCode}"),
            ElevatedButton(
              onPressed: () => Modular.to.pop(),
              child: const Text("Go to main screen"),
            ),
          ],
        ),
      ),
    );
  }
}
