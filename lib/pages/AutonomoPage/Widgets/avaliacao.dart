import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:help_projeto/models/autonomoService.dart';
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
    final provider = Provider.of<AutonomoService>(context);
    final avaliacoes = provider.buscarAvaliacaoPorIdAutonomo(idAutonomo);

    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: avaliacoes.length,
        itemBuilder: ((context, index) {
          return Column(
            children: [
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Text(
                      avaliacoes[index].userName,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Row(
                      children: buildEstrelas(avaliacoes[index].estrelas),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Text(
                      avaliacoes[index].data,
                      style: const TextStyle(color: textColor, fontSize: 12),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: 500,
                child: Text(
                  avaliacoes[index].comentario,
                  style: const TextStyle(
                    color: textColor,
                  ),
                  textAlign: TextAlign.start,
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
