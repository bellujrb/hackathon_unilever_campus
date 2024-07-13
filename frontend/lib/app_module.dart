import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/module/home/presentation/screens/home_screen.dart';
import 'package:frontend/module/home/presentation/screens/scanner_qr_screen.dart';


class AppModule extends Module {

  @override
  List<Bind> get binds => [

  ];

  @override
  List<ChildRoute> get routes => [
    ChildRoute('/', child: (context, args) => const HomeScreen()),
    ChildRoute('/scannerqr', child: (context, args) => QRCodeCameraScreen())
  ];
}

