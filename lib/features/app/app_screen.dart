import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_di/features/user/user_service.dart';

class AppScreen extends StatefulWidget {
  final UserService userService;

  const AppScreen(this.userService, {Key? key}) : super(key: key);

  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text("Instance hash UserService ${widget.userService.hashCode}"),
            Text("Modular.get hash UserService ${Modular.get<UserService>().hashCode}"),
            ElevatedButton(
              onPressed: () => Modular.to.pushNamed("/user/"),
              child: const Text("Go to user screen"),
            ),
          ],
        ),
      ),
    );
  }
}
