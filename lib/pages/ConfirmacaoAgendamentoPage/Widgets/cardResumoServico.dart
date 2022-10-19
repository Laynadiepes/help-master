import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:help_projeto/models/agendamentoApi.dart';
import 'package:help_projeto/models/agendamentoModel.dart';
import 'package:help_projeto/models/autonomoApi.dart';
import 'package:help_projeto/pages/ConfirmacaoAgendamentoPage/Widgets/containerInfo.dart';
import 'package:help_projeto/utils/constants.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../models/servicoModel.dart';

class CardResumoServico extends StatelessWidget {
  CardResumoServico({required this.agendamento, Key? key}) : super(key: key);

  final AgendamentoModel agendamento;

  String formatDate(data) {
    return DateFormat('d/MM/yyyy').format(agendamento.dataHora);
  }

  String formatTime(hora) {
    return DateFormat('hh:mm').format(hora);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AutonomoApi>(context);
    final autonomo =
        provider.buscarAutonomoPorId(agendamento.servicoAgendado.idAutonomo);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  child: Image.asset(agendamento.servicoAgendado.urlImagem),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: 260,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        agendamento.servicoAgendado.titulo,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: subtitleFontSize,
                          color: textColor,
                        ),
                      ),
                      Text(
                        agendamento.servicoAgendado.descricao,
                        style: const TextStyle(
                          fontSize: 14,
                          color: textColor,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Infos(
              icon: Icons.monetization_on_outlined,
              text: " Valor do serviço: ",
              info: "R\$ " + agendamento.servicoAgendado.valor.toString(),
            ),
            Infos(
              icon: Icons.account_circle_outlined,
              text: " Autônomo: ",
              info: autonomo.nomeCompleto,
            ),
            const Divider(
              thickness: 1,
            ),
            Infos(
              icon: Icons.calendar_month_outlined,
              text: " Data:",
              info: formatDate(agendamento.dataHora),
            ),
            Infos(
              icon: Icons.access_time,
              text: " Hora:",
              info: formatTime(agendamento.dataHora),
            )
          ],
        ),
      ),
    );
  }
}
