import 'package:flutter/material.dart';
import 'package:help_projeto/components/autonomoCard.dart';
import 'package:help_projeto/models/autonomoModel.dart';
import 'package:provider/provider.dart';

import '../../../components/servicoCard.dart';
import '../../../models/servicoModel.dart';
import '../../../utils/constants.dart';

class ListaServicosBusca extends StatelessWidget {
  const ListaServicosBusca({super.key, required this.servicos});

  final List<ServicoModel> servicos;

  @override
  Widget build(BuildContext context) {
    if (servicos.isEmpty) {
      return const Padding(
        padding: EdgeInsets.only(top: 100),
        child: Text(
          "Serviços não encontrados",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: textColor),
        ),
      );
    } else {
      return ListView.builder(
        itemCount: servicos.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: servicos[i],
          child: ServicoCard(),
        ),
      );
    }
  }
}
