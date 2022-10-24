import 'dart:ffi';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:help_projeto/components/ultimosAgendamentos_lista.dart';
import 'package:help_projeto/models/agendamentoModel.dart';
import 'package:help_projeto/models/servicoModel.dart';

import '../data/agendamentos_data.dart';

class AgendamentoService with ChangeNotifier {
  List<AgendamentoModel> _agendamentos = agendamentosData;

  List<AgendamentoModel> _agendamentosCancelados = [];

  List<AgendamentoModel> _agendamentosFinalizados = agendamentosFinalizadosData;

  List<AgendamentoModel> get agendamentos {
    return [..._agendamentos];
  }

  List<AgendamentoModel> get agendamentosCancelados {
    return [..._agendamentosCancelados];
  }

  List<AgendamentoModel> get agendamentosFinalizados {
    return [..._agendamentosFinalizados];
  }

  int get agendamentosCount {
    return _agendamentos.length;
  }

  void cancelarAgendamento(AgendamentoModel agendamento) {
    _agendamentosCancelados.add(agendamento);
    _agendamentos.remove(agendamento);
    notifyListeners();
  }

  double get totalAmount {
    double total = 0.0;
    _agendamentos.forEach((AgendamentoModel) {
      total += AgendamentoModel.servicoAgendado.valor;
    });
    return total;
  }

  AgendamentoModel criarAgendamento(DateTime dateTime, ServicoModel servico) {
    return AgendamentoModel(
        idAgendamento: Random().nextDouble().toString(),
        servicoAgendado: servico,
        dataHora: dateTime);
  }

  AgendamentoModel alterarAgendamento(
      AgendamentoModel agendamento, DateTime dateTime) {
    _agendamentosCancelados.remove(agendamento);
    return AgendamentoModel(
        idAgendamento: agendamento.idAgendamento,
        servicoAgendado: agendamento.servicoAgendado,
        dataHora: dateTime);
  }

  void confirmarAgendamento(AgendamentoModel agendamento) {
    _agendamentos.add(agendamento);
    notifyListeners();
  }

  AgendamentoModel buscarAgendamentoPorId(String id) {
    return _agendamentos.where((a) => a.idAgendamento == id).first;
  }

  void clear() {
    _agendamentos = [];
    notifyListeners();
  }
}
