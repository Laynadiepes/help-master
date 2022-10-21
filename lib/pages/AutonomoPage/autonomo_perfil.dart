import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:help_projeto/pages/AutonomoPage/Widgets/avaliacao.dart';
import 'package:help_projeto/utils/constants.dart';
import 'package:provider/provider.dart';

import 'Widgets/contentProfile.dart';
import 'Widgets/topProfile.dart';
import '../../models/autonomoModel.dart';

class AutonomoPerfil extends StatelessWidget {
  AutonomoPerfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AutonomoModel autonomo =
        ModalRoute.of(context)!.settings.arguments as AutonomoModel;

    return Scaffold(
      body: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.zero,
          children: <Widget>[
            TopProfile(autonomo.urlPerfil),
            ChangeNotifierProvider.value(
                value: autonomo, child: const ContentProfile()),
            const SizedBox(height: 8),
          ]),
    );
  }
}
