import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:get_it/get_it.dart';

import 'controller/cadastro_controller.dart';
import 'package:app_2025_03_13/view/exibicao_view.dart';
import 'package:app_2025_03_13/view/home_view.dart';
import 'package:app_2025_03_13/view/cadastro_view.dart';

final g = GetIt.instance;

void main() {
  //Registrar o controlador
  g.registerSingleton<CadastroController>(CadastroController());
  runApp(
    DevicePreview(
      builder: (context) => const MainApp()
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navegação',
      initialRoute: 'home',
      routes: {
        'home': (context) => const HomeView(),
        'cadastro': (context) => const CadastroView(),
        'exibicao': (context) => const ExibicaoView(),
      },
     
    );
  }
}