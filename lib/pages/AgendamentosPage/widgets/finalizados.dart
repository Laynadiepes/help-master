import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../../models/agendamentoApi.dart';
import '../../../models/autonomoApi.dart';
import '../../../utils/constants.dart';
import 'cardAgendamentoResumo.dart';

class Finalizados extends StatelessWidget {
  const Finalizados({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AgendamentoApi>(context);
    final agendamentos = provider.agendamentosFinalizados;
    if (agendamentos.isEmpty) {
      return const Padding(
        padding: EdgeInsets.only(top: 100),
        child: Text(
          "Não existem serviços finalizados",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: textColor),
        ),
      );
    } else {
      return ListView.builder(
          itemCount: agendamentos.length,
          itemBuilder: (ctx, i) => CardAgendamentoResumo(
              agendamento: agendamentos[i],
              textAcao: " Não",
              titleBotao: "Avalie",
              acao: "AvalieAgendamento"));
    }
  }
}
