import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../controller/cadastro_controller.dart';

class ExibicaoView extends StatefulWidget {
  const ExibicaoView({super.key});

  @override
  State<ExibicaoView> createState() => _ExibicaoViewState();
}

class _ExibicaoViewState extends State<ExibicaoView> {
  final ctrl = GetIt.I.get<CadastroController>();

  @override
  void initState() {
    super.initState();
    ctrl.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exibição'),
        actions: [
          IconButton(
            onPressed: () {
              ctrl.limpar();
              //Remover todas as rotas de navegação
              Navigator.pushNamedAndRemoveUntil(
                context,
                'home',
                (Route<dynamic> route) => false,
              );
            },
            icon: Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nome: ${ctrl.txtNome.text}'),
            Text('E-mail: ${ctrl.txtEmail.text}'),
            Text('Aceitar os termos: ${ctrl.aceito}'),
          ],
        ),
      ),
    );
  }
}
