import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:help_projeto/models/autonomoModel.dart';
import 'package:provider/provider.dart';

import '../../utils/constants.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mensagem;
    var autonomo = ModalRoute.of(context)!.settings.arguments as AutonomoModel;
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat com ${autonomo.nomeCompleto}'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 600,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Olá! Gostaria de realizar um orçamento!',
                  suffixIcon: Icon(Icons.send)),
              style: const TextStyle(color: textColor, fontSize: 14),
              maxLines: null,
              maxLength: 150,
              onChanged: (newValue) => {mensagem = newValue},
            ),
          )
        ],
      ),
    );
  }
}
