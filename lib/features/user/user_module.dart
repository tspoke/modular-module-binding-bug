import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_di/features/app/app_module.dart';
import 'package:modular_di/features/user/user_screen.dart';
import 'package:modular_di/features/user/user_service.dart';

class UserModule extends Module {

  @override
  List<Module> get imports => [
    AppModule()
  ];

  @override
  List<Bind> get binds => [
    Bind.singleton<UserService>((i) => UserService(), export: true),
    Bind.factory<UserScreen>((i) => UserScreen(i(), i())),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute("/", child: (context, args) => Modular.get<UserScreen>()),
  ];
}

