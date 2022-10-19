import 'package:flutter/foundation.dart';
import 'package:help_projeto/data/autonomos_data.dart';
import 'package:help_projeto/models/autonomoModel.dart';
import 'package:help_projeto/models/servicoModel.dart';

class ServicoApi with ChangeNotifier {
  Map<String, ServicoModel> _servicosFavoritos = {};

  Map<String, ServicoModel> get servicosFavoritos {
    return {..._servicosFavoritos};
  }

  void addServicoFavorito(ServicoModel servico) {
    _servicosFavoritos.putIfAbsent(servico.id, () => servico);
  }

  void removeServicoFavorito(String idServico) {
    _servicosFavoritos.remove(idServico);
  }
}
