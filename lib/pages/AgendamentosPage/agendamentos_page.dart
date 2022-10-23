import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'widgets/agendados.dart';
import 'widgets/cancelados.dart';
import 'widgets/finalizados.dart';

class AgendamentosPage extends StatelessWidget {
  const AgendamentosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 8,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'Agendados'),
              Tab(text: 'Finalizados'),
              Tab(text: 'Cancelados'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Agendados(),
            Finalizados(),
            Cancelados(),
          ],
        ),
      ),
    );
  }
}
