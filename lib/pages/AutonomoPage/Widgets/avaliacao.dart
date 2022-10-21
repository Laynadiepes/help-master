import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:help_projeto/models/autonomoApi.dart';
import 'package:help_projeto/utils/constants.dart';
import 'package:provider/provider.dart';

import '../../../models/autonomoModel.dart';
import '../../../models/avaliacaoModel.dart';

class Avaliacao extends StatelessWidget {
  Avaliacao({Key? key, this.idAutonomo}) : super(key: key);

  final idAutonomo;

  List<Widget> buildEstrelas(int estrelas) {
    List<Widget> children = [];
    for (int i = 0; i < estrelas; i++) {
      children.add(const Icon(
        Icons.star,
        color: Color.fromARGB(255, 255, 213, 0),
        size: 16,
      ));
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AutonomoApi>(context);
    final avaliacoes = provider.buscarAvaliacaoPorIdAutonomo(idAutonomo);

    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: avaliacoes.length,
        itemBuilder: ((context, index) {
          return Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    avaliacoes[index].userName,
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Row(
                    children: buildEstrelas(avaliacoes[index].estrelas),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  Text(
                    avaliacoes[index].data,
                    style: const TextStyle(color: textColor, fontSize: 12),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                avaliacoes[index].comentario,
                style: const TextStyle(
                  color: textColor,
                ),
              ),
              const Divider(
                height: 40,
              )
            ],
          );
        }));
  }
}
