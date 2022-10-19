import 'package:flutter/foundation.dart';
import 'package:help_projeto/data/autonomos_data.dart';
import 'package:help_projeto/models/autonomoModel.dart';
import 'package:help_projeto/models/avaliacaoModel.dart';
import 'package:help_projeto/models/servicoModel.dart';

class AutonomoApi extends ChangeNotifier {
  final List<AutonomoModel> _autonomos = autonomosData;

  List<AutonomoModel> get autonomos => [..._autonomos];

  List<AutonomoModel> get favoriteAutonomos =>
      _autonomos.where((aut) => aut.isFavorite).toList();

  AutonomoModel buscarAutonomoPorId(String id) {
    return _autonomos.where((aut) => aut.id == id).first;
  }

  List<AvaliacaoModel> buscarAvaliacaoPorIdAutonomo(String id) {
    AutonomoModel autonomo = _autonomos.where((aut) => aut.id == id).first;
    _avaliacoes = autonomo.avaliacao.toList();
    return autonomo.avaliacao.toList();
  }

  List<AvaliacaoModel>? _avaliacoes;

  List<AvaliacaoModel>? get avaliacoes => _avaliacoes;

  updateAvaliacoes(List<AvaliacaoModel> avaliacoes) {
    _avaliacoes = avaliacoes;
    notifyListeners();
  }

  clearAvaliacoes() {
    if (_avaliacoes != null) {
      _avaliacoes!.clear();
    }

    notifyListeners();
  }
}
