import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../../components/autonomoCard.dart';
import '../../../models/autonomoApi.dart';
import '../../../models/autonomoModel.dart';
import '../../../utils/constants.dart';
import '../../ServicosPorCategoriaPage/category_page.dart';

class AutonomosFavoritos extends StatelessWidget {
  const AutonomosFavoritos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AutonomoApi>(context);

    final List<AutonomoModel> favoritos = provider.favoriteAutonomos;
    if (favoritos.isEmpty) {
      return const Padding(
        padding: EdgeInsets.only(top: 100),
        child: Text(
          "Não possui autônomos favoritos",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: textColor),
        ),
      );
    } else {
      return ListView.builder(
        itemCount: favoritos.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: favoritos[i],
          child: AutonomoCard(),
        ),
      );
    }
  }
}
