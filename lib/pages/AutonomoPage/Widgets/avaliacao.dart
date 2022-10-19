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
  Avaliacao({Key? key}) : super(key: key);

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
    final autonomo = Provider.of<AutonomoModel>(context);
    final provider = Provider.of<AutonomoApi>(context);
    List<AvaliacaoModel> avaliacoes = [];
    return Consumer<AutonomoApi>(builder: (context, avaliacaoState, _) {
      if (avaliacaoState.avaliacoes?.length == 0) {
        avaliacoes = provider.buscarAvaliacaoPorIdAutonomo(autonomo.id);
        return Center(
            child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color?>(Colors.grey[500]),
        ));
      } else {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 8),
                const Text('Avaliações',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: textColor,
                        fontSize: subtitleFontSize)),
                const SizedBox(height: 12),
                ListView.builder(
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
                              ListView(
                                  children: buildEstrelas(
                                      avaliacoes[index].estrelas)),
                              const SizedBox(
                                width: 175,
                              ),
                              Text(
                                avaliacoes[index].data,
                                style: const TextStyle(
                                    color: textColor, fontSize: 12),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                avaliacoes[index].comentario,
                                style: const TextStyle(
                                  color: textColor,
                                ),
                              ),
                            ],
                          ),
                          const Divider(
                            height: 40,
                          )
                        ],
                      );
                    }))
              ],
            ),
          ),
        );
      }
    });
  }
}
