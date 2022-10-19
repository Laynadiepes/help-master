import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:help_projeto/pages/AutonomoPage/Widgets/avaliacao.dart';
import 'package:help_projeto/pages/AutonomoPage/Widgets/tag.dart';
import 'package:provider/provider.dart';

import '../../../models/autonomoApi.dart';
import '../../../models/autonomoModel.dart';
import '../../../utils/constants.dart';
import '../../../utils/routes.dart';

class ContentProfile extends StatelessWidget {
  const ContentProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final autonomo = Provider.of<AutonomoModel>(context);

    return Column(
      children: [
        const SizedBox(height: 8),
        Text(
          autonomo.nomeCompleto,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: textColor,
              fontSize: titleFontSize),
        ),
        const SizedBox(height: 8),
        Text(
          autonomo.profissao,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: subTextColor,
              fontSize: subtitleFontSize),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: containerHeight,
                child: ElevatedButton(
                    onPressed: (() {
                      Navigator.of(context).pushNamed(
                        Routes.servicos,
                        arguments: autonomo,
                      );
                    }),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Serviços',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Icon(Icons.checklist)
                      ],
                    )),
              ),
              SizedBox(
                width: containerHeight,
                child: ElevatedButton(
                  onPressed: (() {
                    Navigator.of(context).pushNamed(
                      Routes.chat,
                      arguments: autonomo,
                    );
                  }),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Chat',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Icon(Icons.chat_bubble_outline)
                    ],
                  ),
                ),
              ),
              IconButton(
                onPressed: autonomo.toggleFavorite,
                icon: Icon(
                  autonomo.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: subTextColor,
                  size: 30,
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                const Text('Sobre mim',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: textColor,
                        fontSize: subtitleFontSize)),
                const SizedBox(height: 8),
                Text(autonomo.sobre,
                    style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        color: textColor,
                        fontSize: valueInfoSize)),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                const Text('Competências',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: textColor,
                        fontSize: subtitleFontSize)),
                const SizedBox(height: 12),
                Row(
                  children: const [
                    TagCompetencia(value: 'Competência1'),
                    SizedBox(width: 10),
                    TagCompetencia(value: 'Competência2'),
                    SizedBox(width: 10),
                    TagCompetencia(value: 'Competência3'),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: const [
                    TagCompetencia(value: 'Competência4'),
                    SizedBox(width: 10),
                    TagCompetencia(value: 'Competência5'),
                    SizedBox(width: 10),
                    TagCompetencia(value: 'Competência6'),
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Avaliacao()
      ],
    );
  }
}
