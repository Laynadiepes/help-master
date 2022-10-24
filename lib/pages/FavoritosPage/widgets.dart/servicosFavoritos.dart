import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:help_projeto/models/servicosFavService.dart';
import 'package:provider/provider.dart';

import '../../../components/servicoCard.dart';
import '../../../models/autonomoService.dart';
import '../../../models/autonomoModel.dart';
import '../../../models/servicoModel.dart';
import '../../../utils/constants.dart';

class ServicosFavoritos extends StatelessWidget {
  const ServicosFavoritos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ServicoService>(context);
    final servicosFavoritos = provider.servicosFavoritos.values.toList();
    if (servicosFavoritos.isEmpty) {
      return const Padding(
        padding: EdgeInsets.only(top: 100),
        child: Text(
          "Não possui serviços favoritos",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: textColor),
        ),
      );
    } else {
      return Scaffold(
        body: ListView.builder(
            itemCount: servicosFavoritos.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ChangeNotifierProvider.value(
                      value: servicosFavoritos[index], child: ServicoCard())
                ],
              );
            }),
      );
    }
  }
}
