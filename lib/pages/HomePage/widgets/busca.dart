import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:help_projeto/components/categories_lista.dart';
import 'package:help_projeto/data/categories_data.dart';
import 'package:help_projeto/utils/constants.dart';
import 'package:provider/provider.dart';

import '../../../models/autonomoModel.dart';
import '../../../models/autonomoService.dart';
import '../../../utils/routes.dart';
import '../../ConfirmacaoAgendamentoPage/Widgets/cardMetodoPagamento.dart';

class Busca extends StatelessWidget {
  Busca({super.key});

  final List<CheckBoxModel> categorias = [];
  double estrelas = 1;
  String min = "";
  String max = "";

  void buscaListaCheckbox() {
    for (var categoria in categoriesData) {
      categorias.add(CheckBoxModel(texto: categoria.title));
    }
  }

  _openFilterBottomSheet(BuildContext context) {
    buscaListaCheckbox();
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: 200,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Faixa de Preço (R\$)",
                        style: TextStyle(
                            color: textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            height: 50,
                            child: TextField(
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'R\$ Mínimo',
                                  hintStyle: TextStyle(fontSize: 14)),
                              style: const TextStyle(
                                  color: textColor, fontSize: 14),
                              onChanged: (newValue) => {min = newValue},
                            ),
                          ),
                          const Text(" => ",
                              style: TextStyle(color: textColor)),
                          SizedBox(
                            width: 100,
                            height: 50,
                            child: TextField(
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'R\$ Máximo',
                                  hintStyle: TextStyle(fontSize: 14)),
                              style: const TextStyle(
                                  color: textColor, fontSize: 14),
                              onChanged: (newValue) => {max = newValue},
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Avaliação (À partir de)",
                        style: TextStyle(
                            color: textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 40,
                        child: RatingBar.builder(
                            glowColor: subTextColor,
                            minRating: 1,
                            itemSize: 30,
                            itemBuilder: ((context, index) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                )),
                            onRatingUpdate: (es) => {estrelas = es}),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        "Categorias",
                        style: TextStyle(
                            color: textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 130,
                        child: ListView.builder(
                          itemCount: categorias.length,
                          itemBuilder: (_, int index) {
                            return CheckboxWidget(item: categorias[index]);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                              onPressed: () => {Navigator.of(context).pop()},
                              child: const Text("Salvar filtro")),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final providerAutonomo = Provider.of<AutonomoService>(context);
    List<AutonomoModel> listaAutonomosBusca;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'O que está buscando?',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(
              onPressed: () => _openFilterBottomSheet(context),
              icon: const Icon(Icons.filter_list_rounded)),
          border: const OutlineInputBorder(
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
