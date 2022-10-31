import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:help_projeto/utils/constants.dart';

import '../../../utils/routes.dart';

class ConfirmacaoDialog extends StatelessWidget {
  const ConfirmacaoDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Agendamento Confirmado!"),
      content: const Text(
        "Caso deseje adicionar mais serviços, clique em \"Continuar\" ",
        style: TextStyle(color: textColor),
      ),
      actions: <Widget>[
        TextButton(
            child: const Text("Ver Agendamento"),
            onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(
                Routes.agendamentos, (route) => false,
                arguments: 2)),
        TextButton(
          child: const Text("Continuar"),
          onPressed: () => Navigator.of(context)
              .popUntil((ModalRoute.withName(Routes.servicos))),
        )
      ],
    );
  }
}
