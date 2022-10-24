import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/autonomoModel.dart';
import '../../../models/autonomoService.dart';
import '../../../utils/routes.dart';

class Busca extends StatelessWidget {
  const Busca({super.key});

  @override
  Widget build(BuildContext context) {
    final providerAutonomo = Provider.of<AutonomoService>(context);
    List<AutonomoModel> listaAutonomosBusca;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        decoration: const InputDecoration(
          hintText: 'O que está buscando?',
          prefixIcon: Icon(Icons.search),
          suffixIcon: Icon(Icons.filter_list_rounded),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
        onSubmitted: (dado) {
          Navigator.of(context)
              .pushNamed(Routes.listaEncontrada, arguments: dado);
        },
      ),
    );
  }
}
