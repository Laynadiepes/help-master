import 'package:flutter/material.dart';
import 'package:help_projeto/models/autonomoModel.dart';
import 'package:provider/provider.dart';

import '../../../components/autonomoCard.dart';
import '../../../utils/constants.dart';

class ListaAutonomosBusca extends StatelessWidget {
  const ListaAutonomosBusca({super.key, required this.autonomos});

  final List<AutonomoModel> autonomos;

  @override
  Widget build(BuildContext context) {
    if (autonomos.isEmpty) {
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
        itemCount: autonomos.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: autonomos[i],
          child: AutonomoCard(),
        ),
      );
    }
  }
}
