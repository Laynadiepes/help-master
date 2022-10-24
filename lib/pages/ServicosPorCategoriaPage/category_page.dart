import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:help_projeto/data/autonomos_data.dart';
import 'package:help_projeto/models/autonomoService.dart';
import 'package:help_projeto/models/autonomoModel.dart';
import '../../components/autonomoCard.dart';
import '../../models/categoryModel.dart';
import '../../utils/routes.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AutonomoService>(context);
    final List<AutonomoModel> loadedAutonomos = provider.autonomos;
    final CategoryModel category =
        ModalRoute.of(context)!.settings.arguments as CategoryModel;

    final automatosCategoria = loadedAutonomos.where((automato) {
      return automato.idCategoria.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: automatosCategoria.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: automatosCategoria[i],
          child: AutonomoCard(),
        ),
      ),
    );
  }
}
