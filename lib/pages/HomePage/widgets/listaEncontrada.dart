import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:help_projeto/models/autonomoService.dart';
import 'package:help_projeto/pages/HomePage/widgets/busca.dart';
import 'package:help_projeto/pages/HomePage/widgets/listaAutonomosBusca.dart';
import 'package:help_projeto/pages/ServicosPorCategoriaPage/category_page.dart';
import 'package:help_projeto/utils/constants.dart';
import 'package:provider/provider.dart';

import '../../../models/autonomoModel.dart';

class ListaEncontradaPage extends StatelessWidget {
  const ListaEncontradaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String dado = ModalRoute.of(context)!.settings.arguments as String;
    final provider = Provider.of<AutonomoService>(context);
    final List<AutonomoModel> autonomos = provider.buscarAutonomo(dado);

    return DefaultTabController(
      initialIndex: 0,
      length: 1,
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            const Busca(),
            const TabBar(
              labelColor: primary,
              indicatorColor: primary,
              tabs: [
                // Tab(text: 'Serviços'),
                Tab(text: 'Autônomos'),
                // Tab(text: 'Categorias'),
              ],
            ),
            TabBarView(children: [
              ListaAutonomosBusca(autonomos: autonomos),
            ])
          ],
        ),
      ),
      // body: const TabBarView(
      //   children: [
      //     Agendados(),
      //     Finalizados(),
      //     Cancelados(),
      //   ],
      // ),
    );
  }
}
