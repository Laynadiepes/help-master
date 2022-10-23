import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:help_projeto/models/agendamentoModel.dart';
import 'package:help_projeto/pages/ConfirmacaoAgendamentoPage/Widgets/cardResumoServico.dart';
import 'package:help_projeto/pages/ConfirmacaoAgendamentoPage/Widgets/confirmacaoModal.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../models/agendamentoApi.dart';
import '../../models/servicoModel.dart';
import 'Widgets/cardMetodoPagamento.dart';

class ConfirmacaoAgendamentoPage extends StatelessWidget {
  ConfirmacaoAgendamentoPage({Key? key}) : super(key: key);

  _openConfirmacaoDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return ConfirmacaoDialog();
        });
  }

  @override
  Widget build(BuildContext context) {
    AgendamentoModel agendamento =
        ModalRoute.of(context)!.settings.arguments as AgendamentoModel;

    final AgendamentoApi provider = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Confimação de agendamento"),
      ),
      body: Column(
        children: [
          CardResumoServico(agendamento: agendamento),
          CardMetodoPagamento(),
        ],
      ),
      floatingActionButton: ElevatedButton(
          onPressed: (() {
            provider.confirmarAgendamento(agendamento);
            _openConfirmacaoDialog(context);
          }),
          child: Text("Confirmar agendamento")),
    );
  }
}
