import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../controller/gorjeta_controller.dart';

class GorjetaView extends StatefulWidget {
  const GorjetaView({super.key});

  @override
  State<GorjetaView> createState() => _GorjetaViewState();
}

class _GorjetaViewState extends State<GorjetaView> {
  //Referenciar o objeto GorjetaController
  final ctrl = GetIt.I.get<GorjetaController>();

  @override
  void initState() {
    super.initState();
    //Tratamento de eventos
    ctrl.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      // BARRA DE TÍTULO
      //
      appBar: AppBar(
        title: Text(
          'GorjetaCalc',
          style: TextStyle(
            fontSize: 28,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
      ),
      //
      // BODY
      //
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 50, 30, 30),
        child: Column(
          children: [
            //
            // VALOR DA CONTA
            //
            TextField(
              style: TextStyle(fontSize: 36),
              decoration: InputDecoration(
                labelText: 'Valor da Conta',
                prefixIcon: Icon(Icons.attach_money),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              onChanged: (value) {
                //
                // Armazenar o valor da conta informado pelo usuário
                //
                double v = double.tryParse(value) ?? 0;
                ctrl.atualizarValorConta(v);
              },
            ),
            //
            // PERCENTUAL DE DESCONTO
            //
            SizedBox(height: 20),
            Row(
              children: [
                Text('Percentual da Gorjeta', style: TextStyle(fontSize: 22)),
                SizedBox(width: 30),
                DropdownButton<double>(
                  value: ctrl.percentualGorjeta,
                  onChanged: (double? newValue) {
                    if (newValue != null) {
                      ctrl.atualizarPercentualGorjeta(newValue);
                    }
                  },
                  items: ctrl.listaGorjetas
                      .map<DropdownMenuItem<double>>((double value) {
                    return DropdownMenuItem<double>(
                      value: value,
                      child: Text('$value%'),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 20),
            //
            // BOTÃO CALCULAR
            //
            OutlinedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade900,
                foregroundColor: Colors.white,
                minimumSize: Size(200, 50),
                textStyle: TextStyle(
                  fontSize: 20,
                ),
              ),
              onPressed: () {

                if (ctrl.valorConta > 0) {
                  ctrl.calcularGorjeta();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Informe o valor  da conta'),
                    ),
                  );
                }
                
              },
              child: Text('calcular'),
            ),
            SizedBox(height: 20),
            Divider(),
            Text(
              'Valor da Gorjeta: R\$ ${ctrl.valorGorjeta}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Total a Pagar: R\$ ${ctrl.totalPagar}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}