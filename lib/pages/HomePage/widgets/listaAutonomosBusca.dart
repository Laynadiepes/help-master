import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:help_projeto/components/autonomoCard.dart';
import 'package:help_projeto/models/autonomoModel.dart';
import 'package:provider/provider.dart';

import '../../../models/autonomoService.dart';
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
          "Autônomos não encontrados",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: textColor),
        ),
      );
    } else {
      return ListView.builder(
          itemCount: autonomos.length,
          itemBuilder: (ctx, i) => const AutonomoCard());
    }
  }
}
