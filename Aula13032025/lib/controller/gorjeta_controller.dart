import 'package:flutter/material.dart';

class GorjetaController extends ChangeNotifier {
  double _valorConta = 0.0;
  double _percentualGorjeta = 10.0;
  double _valorGorjeta = 0.0;
  double _totalPagar = 0.0;

  List<double> listaGorjetas = [10.0, 15.0, 20.0, 25.0, 30.0];

  double get valorConta => _valorConta;
  double get percentualGorjeta => _percentualGorjeta;
  String get valorGorjeta => _valorGorjeta.toStringAsFixed(2);
  String get totalPagar => _totalPagar.toStringAsFixed(2);

  void atualizarValorConta(double novoValor) {
    _valorConta = novoValor;
    notifyListeners();
  }

  void atualizarPercentualGorjeta(double novoPercentual) {
    _percentualGorjeta = novoPercentual;
    notifyListeners();
  }

  void calcularGorjeta() {
    _valorGorjeta = (_valorConta  * _percentualGorjeta/100);
    _totalPagar = _valorConta + _valorGorjeta;
    notifyListeners();
  }
}