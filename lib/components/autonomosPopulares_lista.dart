import 'package:flutter/material.dart';
import 'package:help_projeto/models/agendamentoApi.dart';
import 'package:help_projeto/models/agendamentoModel.dart';
import 'package:provider/provider.dart';

import '../models/autonomoApi.dart';
import '../models/categoryModel.dart';
import '../utils/constants.dart';
import '../utils/routes.dart';

class AutonomosPopulares extends StatelessWidget {
  const AutonomosPopulares({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AutonomoApi>(context);
    var autonomos = provider.autonomos;

    return SizedBox(
        height: 120,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              autonomos.length,
              (index) {
                final autonomo = autonomos[index];
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      GestureDetector(
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                            autonomo.urlPerfil,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            Routes.perfilAutomato,
                            arguments: autonomo,
                          );
                        },
                      ),
                      Text(
                        autonomo.profissao,
                        style: const TextStyle(
                          color: textColor,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ));
  }
}