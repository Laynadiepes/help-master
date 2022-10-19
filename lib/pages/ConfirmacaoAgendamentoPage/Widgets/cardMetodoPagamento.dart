import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:help_projeto/models/agendamentoApi.dart';
import 'package:help_projeto/utils/constants.dart';
import 'package:provider/provider.dart';

class CardMetodoPagamento extends StatelessWidget {
  CardMetodoPagamento({Key? key}) : super(key: key);

  // final List<CheckBoxModel> itens = [
  //   CheckBoxModel(texto: "Cartao de credito"),
  //   CheckBoxModel(texto: "Cartao de debito"),
  //   CheckBoxModel(texto: "Dinheito"),
  //   CheckBoxModel(texto: "Pix"),
  //   CheckBoxModel(texto: "Tranferencia em Cc"),
  //   CheckBoxModel(texto: "Leticia"),
  //   CheckBoxModel(texto: "Nadir"),
  // ];

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Text(
                  "Selecione o método de pagamento",
                  style:
                      TextStyle(color: textColor, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
