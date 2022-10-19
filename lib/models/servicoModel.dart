import 'package:flutter/foundation.dart';

class ServicoModel with ChangeNotifier {
  final String id;
  final String idAutonomo;
  final String titulo;
  final String descricao;
  final String urlImagem;
  final double valor;
  bool isFavorite;

  ServicoModel({
    required this.id,
    required this.idAutonomo,
    required this.titulo,
    required this.descricao,
    required this.urlImagem,
    required this.valor,
    this.isFavorite = false,
  });

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
