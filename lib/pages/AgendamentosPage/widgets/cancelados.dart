import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:help_projeto/utils/constants.dart';
import 'package:provider/provider.dart';

import '../../../models/agendamentoService.dart';
import 'cardAgendamentoResumo.dart';

class Cancelados extends StatelessWidget {
  const Cancelados({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AgendamentoService>(context);
    final agendamentos = provider.agendamentosCancelados;
    if (agendamentos.isEmpty) {
      return const Padding(
        padding: EdgeInsets.only(top: 100),
        child: Text(
          "Não existem serviços cancelados",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: textColor),
        ),
      );
    } else {
      return ListView.builder(
          itemCount: agendamentos.length,
          itemBuilder: (ctx, i) => CardAgendamentoResumo(
              agendamento: agendamentos[i],
              textAcao: "Reagende o serviço para outra data/hora.",
              titleBotao: "Reagendar",
              acao: "Reagendar"));
    }
  }
}
