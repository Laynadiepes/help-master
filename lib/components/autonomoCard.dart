import 'package:flutter/material.dart';
import 'package:help_projeto/utils/constants.dart';
import 'package:provider/provider.dart';

import '../models/autonomoModel.dart';
import '../utils/routes.dart';

class AutonomoCard extends StatelessWidget {
  const AutonomoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final autonomo = Provider.of<AutonomoModel>(context);
    return GestureDetector(
      child: Card(
        child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(autonomo.urlPerfil),
            ),
            title: Text(
              autonomo.nomeCompleto,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
            subtitle: Text(autonomo.profissao),
            trailing: SizedBox(
                width: 80,
                child: Row(
                  children: [
                    autonomo.isFavorite
                        ? InkWell(
                            onTap: () => autonomo.toggleFavorite(),
                            child: const Icon(
                              Icons.favorite,
                              color: subTextColor,
                            ),
                          )
                        : InkWell(
                            onTap: () => autonomo.toggleFavorite(),
                            child: const Icon(
                              Icons.favorite_border,
                              color: subTextColor,
                            ),
                          ),
                    const SizedBox(
                      width: 25,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Icon(
                          Icons.star,
                          color: Color.fromRGBO(252, 191, 5, 1),
                        ), // icon
                        Text(autonomo.estrelas.toString()), // text
                      ],
                    ),
                  ],
                ))),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(
          Routes.perfilAutomato,
          arguments: autonomo,
        );
      },
    );
  }
}
