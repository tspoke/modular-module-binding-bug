import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_di/features/app/app_service.dart';
import 'package:modular_di/features/user/user_service.dart';

class AppScreen extends StatefulWidget {
  final AppService appService;

  const AppScreen(this.appService, {Key? key}) : super(key: key);

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
            Text("Instance hash AppService ${widget.appService.hashCode}"),
            Text("Modular.get hash AppService ${Modular.get<AppService>().hashCode}"),
            Text("SAME = ${Modular.get<AppService>().hashCode == widget.appService.hashCode}"),
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
