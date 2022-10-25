import 'package:flutter/foundation.dart';
import 'package:help_projeto/data/autonomos_data.dart';
import 'package:help_projeto/data/categories_data.dart';
import 'package:help_projeto/models/autonomoModel.dart';
import 'package:help_projeto/models/avaliacaoModel.dart';
import 'package:help_projeto/models/categoryModel.dart';
import 'package:help_projeto/models/servicoModel.dart';
import 'package:intl/intl.dart';

class AutonomoService with ChangeNotifier {
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

  List<AutonomoModel> buscarAutonomosPorIdCategoria(String id) {
    List<AutonomoModel> autonomos =
        _autonomos.where((aut) => aut.idCategoria == id).toList();
    return autonomos;
  }

  List<ServicoModel> buscarServico(String dado) {
    //Busca servicos pelo nome
    List<ServicoModel> servicos = [];
    for (var autonomo in _autonomos) {
      List<ServicoModel> servicosNome = autonomo.servico
          .where((ser) => ser.titulo.toLowerCase().contains(dado.toLowerCase()))
          .toList();
      servicos.addAll(servicosNome);
    }

    return servicos;
  }

  List<AutonomoModel> buscarAutonomo(String dado) {
    //Busca autonomos pelo nome

    List<AutonomoModel> autonomos = _autonomos
        .where((aut) =>
            aut.nomeCompleto.toLowerCase().contains(dado.toLowerCase()))
        .toList();

    //Busca autonomos pela categoria
    List<AutonomoModel> autonomosCategoria = [];
    List<CategoryModel> categorias = categoriesData
        .where((cat) => cat.title.toLowerCase().contains(dado.toLowerCase()))
        .toList();

    for (var categoria in categorias) {
      autonomosCategoria = buscarAutonomosPorIdCategoria(categoria.id);
      autonomos.addAll(autonomosCategoria);
    }

    //Busca autonomos por profissão
    List<AutonomoModel> autonomosProfissao = _autonomos
        .where(
            (aut) => aut.profissao.toLowerCase().contains(dado.toLowerCase()))
        .toList();
    autonomos.addAll(autonomosProfissao);

    //Busca autonomos por serviço
    List<AutonomoModel> autonomosServicos = [];
    for (int i = 0; i <= autonomos.length; i++) {
      autonomosServicos = _autonomos
          .where((aut) =>
              aut.servico[i].titulo.toLowerCase().contains(dado.toLowerCase()))
          .toList();
      autonomos.addAll(autonomosServicos);
    }

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
