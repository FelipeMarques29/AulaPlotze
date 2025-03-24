import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'controller/gorjeta_controller.dart';
import 'view/gorjeta_view.dart';

//Inicializar o plugin GetIt
final g = GetIt.instance;

void main() {

  g.registerSingleton<GorjetaController>(GorjetaController());

  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GorjetaView(),
    );
  }
}