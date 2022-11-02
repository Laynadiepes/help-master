import 'package:flutter/material.dart';
import 'package:help_projeto/models/agendamentoService.dart';
import 'package:help_projeto/models/agendamentoModel.dart';
import 'package:help_projeto/utils/constants.dart';
import 'package:provider/provider.dart';

import '../models/autonomoService.dart';
import '../models/categoryModel.dart';
import '../utils/routes.dart';

class UltimosAgendamentos extends StatelessWidget {
  const UltimosAgendamentos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AgendamentoService>(context);
    var agendamentos = provider.agendamentos;
    var providerAutonomos = Provider.of<AutonomoService>(context);

    return SizedBox(
        height: 120,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            reverse: true,
            scrollDirection: Axis.horizontal,
            children: List.generate(
              agendamentos.length,
              (index) {
                final agendamento = agendamentos[index];
                return Column(
                  children: [
                    GestureDetector(
                      child: Card(
                        shadowColor: subTextColor,
                        elevation: 6,
                        child: SizedBox(
                          height: 70,
                          width: 70,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                                agendamento.servicoAgendado.urlImagem,
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      onTap: () {
                        var autonomo = providerAutonomos.buscarAutonomoPorId(
                            agendamento.servicoAgendado.idAutonomo);
                        Navigator.of(context).pushNamed(
                          Routes.servicos,
                          arguments: autonomo,
                        );
                      },
                    ),
                    Text(
                        agendamento.servicoAgendado.titulo.length > 10
                            ? "${agendamento.servicoAgendado.titulo.substring(0, 9)}..."
                            : agendamento.servicoAgendado.titulo,
                        style: const TextStyle(color: textColor, fontSize: 12)),
                  ],
                );
              },
            ),
          ),
        ));
  }
}
