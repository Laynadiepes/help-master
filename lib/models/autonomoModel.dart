import 'package:flutter/foundation.dart';
import 'package:help_projeto/models/avaliacaoModel.dart';
import 'package:help_projeto/models/servicoModel.dart';

class AutonomoModel with ChangeNotifier {
  final String id;
  final String profissao;
  final String nomeCompleto;
  final String idCategoria;
  final String sobre;
  final double estrelas;
  final List<ServicoModel> servico;
  final List<AvaliacaoModel> avaliacao;
  final String urlPerfil;
  bool isFavorite;

  AutonomoModel({
    required this.id,
    required this.profissao,
    required this.sobre,
    required this.nomeCompleto,
    required this.estrelas,
    required this.idCategoria,
    required this.servico,
    required this.urlPerfil,
    required this.avaliacao,
    this.isFavorite = false,
  });

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
