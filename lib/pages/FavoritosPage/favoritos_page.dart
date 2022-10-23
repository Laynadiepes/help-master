import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:help_projeto/pages/FavoritosPage/widgets.dart/servicosFavoritos.dart';

import 'widgets.dart/autonomosFavoritos.dart';

class FavoritosPage extends StatelessWidget {
  const FavoritosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 8,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'Autônomos'),
              Tab(text: 'Serviços'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AutonomosFavoritos(),
            ServicosFavoritos(),
          ],
        ),
      ),
    );
  }
}
