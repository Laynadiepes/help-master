import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:help_projeto/models/agendamentoApi.dart';
import 'package:help_projeto/utils/constants.dart';
import 'package:provider/provider.dart';

class CardMetodoPagamento extends StatelessWidget {
  CardMetodoPagamento({Key? key}) : super(key: key);

  final bool value = false;

  final List<CheckBoxModel> itens = [
    CheckBoxModel(texto: "Cartão de crédito"),
    CheckBoxModel(texto: "Cartão de débito"),
    CheckBoxModel(texto: "Dinheiro"),
    CheckBoxModel(texto: "Pix"),
    CheckBoxModel(texto: "Tranferência"),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "  Selecione o método de pagamento",
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              ),
              ListView.builder(
                padding: EdgeInsets.only(top: 10),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: itens.length,
                itemBuilder: (_, int index) {
                  return CheckboxWidget(item: itens[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CheckboxWidget extends StatefulWidget {
  const CheckboxWidget({Key? key, required this.item}) : super(key: key);

  final CheckBoxModel item;

  @override
  _CheckboxWidgetState createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        widget.item.texto,
        style: TextStyle(color: textColor, fontSize: 16),
      ),
      value: widget.item.checked,
      onChanged: (bool? value) {
        setState(() {
          widget.item.checked = value!;
        });
      },
      activeColor: primary,
    );
  }
}

class CheckBoxModel {
  final String texto;
  bool checked;

  CheckBoxModel({
    required this.texto,
    this.checked = false,
  });
}
