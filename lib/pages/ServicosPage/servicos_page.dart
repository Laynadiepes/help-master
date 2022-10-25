import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:help_projeto/components/servicoCard.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../models/autonomoModel.dart';
import '../../models/servicoModel.dart';
import '../../utils/constants.dart';
import '../../utils/routes.dart';

class ServicosPage extends StatelessWidget {
  const ServicosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AutonomoModel autonomo =
        ModalRoute.of(context)!.settings.arguments as AutonomoModel;

    return Scaffold(
      appBar: AppBar(title: Text("Serviços")),
      body: ListView.builder(
          itemCount: autonomo.servico.length,
          itemBuilder: (context, index) {
            final servico = autonomo.servico[index];
            return Column(
              children: [
                ChangeNotifierProvider.value(
                  value: servico,
                  child: ServicoCard(),
                ),
              ],
            );
          }),
    );
  }
}
