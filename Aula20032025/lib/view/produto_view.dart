//
// produto_view.dart
//
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../controller/produto_controller.dart';

class ProdutoView extends StatefulWidget {
  const ProdutoView({super.key});

  @override
  State<ProdutoView> createState() => _ProdutoViewState();
}

class _ProdutoViewState extends State<ProdutoView> {
  final ctrl = GetIt.I.get<ProdutoController>();

  @override
  void initState() {
    super.initState();
    ctrl.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      // BARRA DE TÍTULO
      //
      appBar: AppBar(
        title: Text('Produtos', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue.shade900,
        actions: [
          IconButton(
            onPressed: () {
              ctrl.alterarVisualizacao(true);
            },
            icon: Icon(Icons.view_list_outlined, color: Colors.white),
          ),
          IconButton(
            onPressed: () {
              ctrl.alterarVisualizacao(false);
            },
            icon: Icon(Icons.grid_view_outlined, color: Colors.white),
          ),
        ],
      ),
      //
      // CORPO
      //
      body: Padding(
        padding: EdgeInsets.all(30),
        child: ctrl.visualizarList ? visualizarLista() : visualizarGrid(),
      ),
    );
  }

  Widget visualizarLista() {
    return SizedBox(
      child: ListView.builder(
        itemCount: ctrl.produtos.length,
        itemBuilder: (context, index) {
          final item = ctrl.produtos[index];
          return SizedBox(
            width: 150,
            child: Card(
              child: ListTile(
                title: Text(item.nome),
                subtitle: Text('{R\$ ${item.preco.toStringAsFixed(2)}}'),
                trailing: SizedBox(
                  width: 80,
                  child: Row(
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                      IconButton(
                        onPressed: () {
                          ctrl.removerItem(index);
                        },
                        icon: Icon(Icons.delete_outline),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget visualizarGrid() {
    return GridView.builder(
      itemCount: ctrl.produtos.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (context, index) {
        final item = ctrl.produtos[index];
        return SizedBox(
          width: 150,
          child: Card(
            child: ListTile(
              title: Text(item.nome),
              subtitle: Text('{R\$ ${item.preco.toStringAsFixed(2)}}'),
            ),
          ),
        );
      },
    );
  }
}