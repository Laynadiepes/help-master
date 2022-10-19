import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:help_projeto/models/agendamentoApi.dart';
import 'package:help_projeto/models/agendamentoModel.dart';
import 'package:help_projeto/pages/AgendamentosPage/widgets/cardAgendamentoResumo.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../models/autonomoApi.dart';
import '../../../utils/constants.dart';

class Agendados extends StatelessWidget {
  const Agendados({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AgendamentoApi>(context);
    final agendamentos = provider.agendamentos;

    if (agendamentos.isEmpty) {
      return const Padding(
        padding: EdgeInsets.only(top: 100),
        child: Text(
          "Não existem serviços agendados",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: textColor),
        ),
      );
    } else {
      return ListView.builder(
          reverse: true,
          itemCount: agendamentos.length,
          itemBuilder: (ctx, i) => CardAgendamentoResumo(
              agendamento: agendamentos[i],
              textAcao:
                  " Esse serviço pode ser cancelado até ${DateFormat('d/MM/yyyy').format(agendamentos[i].dataHora.subtract(
                        const Duration(days: 1),
                      ))}",
              titleBotao: "Cancelar",
              acao: "cancelarAgendamento"));
    }
  }
}
