import 'package:flutter/foundation.dart';
import 'package:help_projeto/data/autonomos_data.dart';
import 'package:help_projeto/models/autonomoModel.dart';
import 'package:help_projeto/models/avaliacaoModel.dart';
import 'package:help_projeto/models/servicoModel.dart';
import 'package:intl/intl.dart';

class AutonomoApi with ChangeNotifier {
  final List<AutonomoModel> _autonomos = autonomosData;

  List<AutonomoModel> get autonomos => [..._autonomos];

  List<AutonomoModel> get avaliacoes => [..._autonomos];

  List<AutonomoModel> get favoriteAutonomos =>
      _autonomos.where((aut) => aut.isFavorite).toList();

  AutonomoModel buscarAutonomoPorId(String id) {
    return _autonomos.where((aut) => aut.id == id).first;
  }

  List<AvaliacaoModel> buscarAvaliacaoPorIdAutonomo(String id) {
    AutonomoModel autonomo = _autonomos.where((aut) => aut.id == id).first;
    return autonomo.avaliacao.toList();
  }

  List<AutonomoModel> buscarAutonomo(String dado) {
    List<AutonomoModel> autonomos =
        _autonomos.where((aut) => aut.nomeCompleto.contains(dado)).toList();
    return autonomos;
  }

  void criarAvaliacao(String comentario, String idAutonomo, double estrelas) {
    var avaliacao = AvaliacaoModel(
      userName: 'Layna Diepes',
      userProfileImage: 'assets/layna.jpeg',
      comentario: comentario,
      idAutonomo: idAutonomo,
      estrelas: estrelas.toInt(),
      data: DateFormat(' d/MM/yyyy').format(DateTime.now()),
    );
    adicionarAvalicaoPorAutonomo(avaliacao);
  }

  void adicionarAvalicaoPorAutonomo(AvaliacaoModel avaliacao) {
    AutonomoModel autonomo =
        _autonomos.where((aut) => aut.id == avaliacao.idAutonomo).first;
    autonomo.avaliacao.add(avaliacao);
    notifyListeners();
  }
}
