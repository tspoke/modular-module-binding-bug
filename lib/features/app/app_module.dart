import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_di/features/app/app_screen.dart';
import 'package:modular_di/features/user/user_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [UserModule()];

  @override
  List<Bind> get binds => [
        Bind.factory<AppScreen>((i) => AppScreen(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (context, args) => Modular.get<AppScreen>()),
        ModuleRoute("/user/", module: UserModule()),
      ];
}
