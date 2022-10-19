import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:help_projeto/utils/constants.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.all(6.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                'assets/layna.jpeg',
              ),
            ),
          ),
          title: const Text("Layna Diepes")),
      body: Column(
        children: [
          ListTile(
              leading: const Icon(Icons.settings_applications_outlined),
              title: const Text(
                "Configurações",
                style: TextStyle(color: textColor),
              ),
              onTap: () => {},
              trailing: const Icon(Icons.arrow_right_rounded)),
          ListTile(
              leading: const Icon(Icons.chat_bubble_outline_rounded),
              title: const Text(
                "Conversas",
                style: TextStyle(color: textColor),
              ),
              onTap: () => {},
              trailing: const Icon(Icons.arrow_right_rounded)),
          ListTile(
              leading: const Icon(Icons.circle_notifications_outlined),
              title: const Text(
                "Notificações",
                style: TextStyle(color: textColor),
              ),
              onTap: () => {},
              trailing: const Icon(Icons.arrow_right_rounded)),
          ListTile(
              leading: const Icon(Icons.library_books_outlined),
              title: const Text(
                "Dados",
                style: TextStyle(color: textColor),
              ),
              onTap: () => {},
              trailing: const Icon(Icons.arrow_right_rounded)),
          ListTile(
              leading: const Icon(Icons.help_center_outlined),
              title: const Text(
                "Ajuda",
                style: TextStyle(color: textColor),
              ),
              onTap: () => {},
              trailing: const Icon(Icons.arrow_right_rounded)),
          ListTile(
              leading: const Icon(Icons.shield_outlined),
              title: const Text(
                "Privacidade",
                style: TextStyle(color: textColor),
              ),
              onTap: () => {},
              trailing: const Icon(Icons.arrow_right_rounded)),
        ],
      ),
    );
  }
}
