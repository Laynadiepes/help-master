import 'package:flutter/foundation.dart';
import 'package:help_projeto/models/servicoModel.dart';

class AgendamentoModel with ChangeNotifier {
  final String idAgendamento;
  final ServicoModel servicoAgendado;
  DateTime dataHora;

  AgendamentoModel({
    required this.idAgendamento,
    required this.servicoAgendado,
    required this.dataHora,
  });
}
