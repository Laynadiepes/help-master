import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:help_projeto/models/autonomoService.dart';
import 'package:help_projeto/pages/HomePage/widgets/busca.dart';
import 'package:help_projeto/pages/HomePage/widgets/listaAutonomosBusca.dart';
import 'package:help_projeto/pages/HomePage/widgets/listaServicosBusca.dart';
import 'package:help_projeto/pages/ServicosPorCategoriaPage/category_page.dart';
import 'package:help_projeto/utils/constants.dart';
import 'package:provider/provider.dart';

import '../../../models/autonomoModel.dart';
import '../../../models/servicoModel.dart';

class ListaEncontradaPage extends StatelessWidget {
  const ListaEncontradaPage({super.key});
  @override
  Widget build(BuildContext context) {
    final String dado = ModalRoute.of(context)!.settings.arguments as String;
    final provider = Provider.of<AutonomoService>(context);
    final List<AutonomoModel> autonomos = provider.buscarAutonomo(dado);
    final List<ServicoModel> servicos = provider.buscarServico(dado);

    return DefaultTabController(
      initialIndex: 0,
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
        body: TabBarView(children: [
          ListaAutonomosBusca(autonomos: autonomos),
          ListaServicosBusca(servicos: servicos)
        ]),
      ),
    );
  }
}
