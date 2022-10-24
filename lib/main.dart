import 'package:flutter/material.dart';
import 'package:help_projeto/models/agendamentoService.dart';
import 'package:help_projeto/models/autonomoService.dart';
import 'package:help_projeto/models/servicosFavService.dart';
import 'package:help_projeto/pages/AgendamentosPage/agendamentos_page.dart';
import 'package:help_projeto/pages/AutonomoPage/autonomo_perfil.dart';
import 'package:help_projeto/pages/ConfirmacaoAgendamentoPage/ConfirmacaoAgendamento_Page.dart';
import 'package:help_projeto/pages/FavoritosPage/favoritos_page.dart';
import 'package:help_projeto/pages/HomePage/widgets/listaEncontrada.dart';
import 'package:help_projeto/pages/PerfilPage/perfil_page.dart';
import 'package:help_projeto/pages/ServicosPorCategoriaPage/category_page.dart';
import 'package:help_projeto/pages/ChatPage/chat_page.dart';
import 'package:help_projeto/pages/HomePage/home_page.dart';
import 'package:help_projeto/pages/ServicosPage/servicos_page.dart';
import 'package:help_projeto/utils/constants.dart';
import 'package:provider/provider.dart';

import 'utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData tema = ThemeData();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AutonomoService(),
        ),
        ChangeNotifierProvider(
          create: (_) => AgendamentoService(),
        ),
        ChangeNotifierProvider(
          create: (_) => ServicoService(),
        ),
      ],
      child: MaterialApp(
        theme: tema.copyWith(
          colorScheme: tema.colorScheme.copyWith(
            primary: const Color.fromARGB(255, 230, 113, 29),
            secondary: const Color.fromRGBO(230, 113, 29, 100),
          ),
          textTheme: tema.textTheme.copyWith(
            headline6: const TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        routes: {
          Routes.home: (ctx) => const HomePage(),
          Routes.category_page: (ctx) => const CategoryPage(),
          Routes.perfilAutomato: (ctx) => AutonomoPerfil(),
          Routes.servicos: (ctx) => ServicosPage(),
          Routes.chat: (ctx) => ChatPage(),
          Routes.confirmacaoAgendamento: (ctx) => ConfirmacaoAgendamentoPage(),
          Routes.agendamentos: (ctx) => AgendamentosPage(),
          Routes.favoritos: (ctx) => FavoritosPage(),
          Routes.perfil: (ctx) => const PerfilPage(),
          Routes.listaEncontrada: (ctx) => const ListaEncontradaPage(),
        },
      ),
    );
  }
}
