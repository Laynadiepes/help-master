import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:help_projeto/models/agendamentoModel.dart';
import 'package:help_projeto/pages/AgendamentosPage/widgets/reagendamentoDialog.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../models/agendamentoApi.dart';
import '../../../models/autonomoApi.dart';
import '../../../utils/constants.dart';
import '../../../utils/routes.dart';

class CardAgendamentoResumo extends StatelessWidget {
  const CardAgendamentoResumo(
      {required this.agendamento,
      required this.acao,
      required this.textAcao,
      required this.titleBotao,
      Key? key})
      : super(key: key);
  final AgendamentoModel agendamento;
  final String textAcao;
  final String titleBotao;
  final String acao;

  void _showDialogReagendamento(
      BuildContext context, AgendamentoModel agendamento) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text("Selecione nova data/hora"),
              actions: <Widget>[
                ReagendamentoDialog(
                  agendamento: agendamento,
                )
              ]);
        });
  }

  void _showDialogCancelar(BuildContext context, AgendamentoApi provider) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Cancelar Serviço"),
          content: const Text(
            "Tem certeza que deseja cancelar esse serviço?",
            style: TextStyle(color: textColor),
          ),
          actions: <Widget>[
            TextButton(
                child: const Text("Fechar"),
                onPressed: () => Navigator.of(context).pop()),
            TextButton(
              child: const Text("Cancelar"),
              onPressed: () {
                provider.cancelarAgendamento(agendamento);
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final providerAutonomo = Provider.of<AutonomoApi>(context);
    final provider = Provider.of<AgendamentoApi>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shadowColor: subTextColor,
        elevation: 4,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Image.asset(
                      width: 70,
                      height: 70,
                      agendamento.servicoAgendado.urlImagem,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 260,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          agendamento.servicoAgendado.titulo,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: textColor,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_month_outlined,
                              color: subTextColor,
                            ),
                            Text(
                              DateFormat(' d/MM/yyyy')
                                  .format(agendamento.dataHora),
                              style: const TextStyle(color: textColor),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Icon(
                              Icons.access_time,
                              color: subTextColor,
                            ),
                            Text(
                              DateFormat(' hh:mm').format(agendamento.dataHora),
                              style: const TextStyle(color: textColor),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.monetization_on_outlined,
                              color: subTextColor,
                            ),
                            Text(
                              " ${agendamento.servicoAgendado.valor}",
                              style: const TextStyle(color: textColor),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Icon(
                              Icons.account_circle_outlined,
                              color: subTextColor,
                            ),
                            Text(
                              " ${providerAutonomo.buscarAutonomoPorId(agendamento.servicoAgendado.idAutonomo).nomeCompleto}",
                              style: const TextStyle(color: textColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    textAcao,
                    style: const TextStyle(fontSize: 12, color: textColor),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (acao == "cancelarAgendamento") {
                          _showDialogCancelar(context, provider);
                        }
                        if (acao == "AvaliarAgendamento") {
                          // provider.cancelarAgendamento(agendamento);
                        }
                        if (acao == "Reagendar") {
                          _showDialogReagendamento(context, agendamento);
                        }
                      },
                      child: Text(titleBotao))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
