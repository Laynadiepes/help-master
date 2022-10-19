import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:help_projeto/pages/ConfirmacaoAgendamentoPage/ConfirmacaoAgendamento_Page.dart';
import 'package:help_projeto/pages/FavoritosPage/favoritos_page.dart';
import 'package:help_projeto/pages/PerfilPage/perfil_page.dart';
import 'package:help_projeto/utils/constants.dart';
import 'package:provider/provider.dart';

import '../../components/autonomosPopulares_lista.dart';
import '../../components/categories_lista.dart';
import '../../components/ultimosAgendamentos_lista.dart';
import '../../data/categories_data.dart';
import '../../models/categoryModel.dart';
import '../../utils/routes.dart';
import '../AgendamentosPage/agendamentos_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final ScrollController _homeController = ScrollController();

  final screens = [
    HomePageComponent(),
    FavoritosPage(),
    AgendamentosPage(),
    PerfilPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: "Favoritos",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.check_box_outlined),
              label: "Agendamentos",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.account_box_outlined),
              label: "Perfil",
            ),
          ],
          onTap: (int index) {
            if (_selectedIndex == index) {
              _homeController.animateTo(
                0.0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOut,
              );
            }
            setState(() => _selectedIndex = index);
          }),
      body: screens[_selectedIndex],
    );
  }
}

class HomePageComponent extends StatelessWidget {
  const HomePageComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List loadedCategories = categoriesData;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/logoBranca.png',
              fit: BoxFit.contain,
              height: 40,
            ),
            Container(
                padding: const EdgeInsets.only(left: 10),
                child: const Text(
                  'Help Me',
                  style: TextStyle(fontSize: 24),
                ))
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Busca',
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.filter_list_rounded),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 12),
                child: Text(
                  'CATEGORIAS',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: subTextColor,
                  ),
                ),
              ),
              CategoriesList(loadedCategories),
              const Padding(
                padding: EdgeInsets.only(left: 12),
                child: Text(
                  'ÚLTIMOS AGENDADOS POR VOCÊ',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: subTextColor,
                  ),
                ),
              ),
              UltimosAgendamentos(),
              const Padding(
                padding: EdgeInsets.only(left: 12),
                child: Text(
                  'POPULARES NA REGIÃO',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: subTextColor,
                  ),
                ),
              ),
              AutonomosPopulares(),
              const Padding(
                padding: EdgeInsets.only(left: 12),
                child: Text(
                  'GANHE PONTOS HELP',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: subTextColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
