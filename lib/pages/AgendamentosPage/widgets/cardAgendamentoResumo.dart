import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:help_projeto/models/agendamentoModel.dart';
import 'package:help_projeto/pages/AgendamentosPage/widgets/reagendamentoDialog.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

import '../../../models/agendamentoService.dart';
import '../../../models/autonomoService.dart';
import '../../../utils/constants.dart';

class CardAgendamentoResumo extends StatelessWidget {
  const CardAgendamentoResumo(
      {required this.agendamento,
      required this.acao,
      required this.textAcao,
      required this.titleBotao,
      Key? key})
      : super(key: key);
  final AgendamentoModel agendamento;
  final String textAcao;
  final String titleBotao;
  final String acao;

  // void getGaleria() async {
  //   var fileName = await ImagePicker()

  // }

  void _showDialogReagendamento(
      BuildContext context, AgendamentoModel agendamento) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text("Selecione nova data/hora"),
              actions: <Widget>[
                ReagendamentoDialog(
                  agendamento: agendamento,
                )
              ]);
        });
  }

  void _showDialogCancelar(BuildContext context, AgendamentoService provider) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Cancelar Serviço"),
          content: const Text(
            "Tem certeza que deseja cancelar esse serviço?",
            style: TextStyle(color: textColor),
          ),
          actions: <Widget>[
            TextButton(
                child: const Text("Fechar"),
                onPressed: () => Navigator.of(context).pop()),
            TextButton(
              child: const Text("Cancelar"),
              onPressed: () {
                provider.cancelarAgendamento(agendamento);
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  void _showDialogAvaliacao(
      BuildContext context, AutonomoService provider, String idAutonomo) {
    double estrelas = 1;
    String comentario = '';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Avaliação"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    "Qual seu nível de satisfação com o serviço?",
                    style: TextStyle(color: textColor),
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: RatingBar.builder(
                      minRating: 1,
                      itemBuilder: ((context, index) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          )),
                      onRatingUpdate: (es) => {estrelas = es}),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 150),
                  child: TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Fale um pouco sobre sua experiência',
                        hintStyle: TextStyle(fontSize: 14)),
                    style: const TextStyle(color: textColor, fontSize: 14),
                    maxLines: null,
                    maxLength: 150,
                    onChanged: (newValue) => {comentario = newValue},
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () => {},
                      icon: const Icon(
                        Icons.file_upload_outlined,
                        color: textColor,
                      ),
                    ),
                    const Text(
                      'Adicionar Fotos/Vídeos',
                      style: TextStyle(color: textColor),
                    ),
                  ],
                )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
                child: const Text("Fechar"),
                onPressed: () => Navigator.of(context).pop()),
            TextButton(
              child: const Text("Salvar"),
              onPressed: () {
                provider.criarAvaliacao(comentario, idAutonomo, estrelas);
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final providerAutonomo = Provider.of<AutonomoService>(context);
    final provider = Provider.of<AgendamentoService>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shadowColor: subTextColor,
        elevation: 4,
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 6,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    width: 80,
                    height: 80,
                    agendamento.servicoAgendado.urlImagem,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                SizedBox(
                  width: 260,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          agendamento.servicoAgendado.titulo,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: textColor,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_month_outlined,
                              color: subTextColor,
                              size: 30,
                            ),
                            Text(
                              DateFormat(' d/MM/yyyy')
                                  .format(agendamento.dataHora),
                              style: const TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Icon(
                              Icons.access_time,
                              color: subTextColor,
                              size: 30,
                            ),
                            Text(
                              DateFormat(' hh:mm').format(agendamento.dataHora),
                              style: const TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 3,
                            ),
                            const Icon(
                              Icons.monetization_on_outlined,
                              color: subTextColor,
                            ),
                            Text(
                              " ${agendamento.servicoAgendado.valor.toStringAsFixed(2)}",
                              style: const TextStyle(color: textColor),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Icon(
                              Icons.account_circle_outlined,
                              color: subTextColor,
                            ),
                            Text(
                              " ${providerAutonomo.buscarAutonomoPorId(agendamento.servicoAgendado.idAutonomo).nomeCompleto}",
                              style: const TextStyle(color: textColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 6,
                    fit: FlexFit.tight,
                    child: Text(
                      textAcao,
                      style: const TextStyle(fontSize: 12, color: textColor),
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    fit: FlexFit.tight,
                    child: ElevatedButton(
                        onPressed: () {
                          if (acao == "cancelarAgendamento") {
                            _showDialogCancelar(context, provider);
                          }
                          if (acao == "avaliarAgendamento") {
                            _showDialogAvaliacao(context, providerAutonomo,
                                agendamento.servicoAgendado.idAutonomo);
                          }
                          if (acao == "Reagendar") {
                            _showDialogReagendamento(context, agendamento);
                          }
                        },
                        child: Text(titleBotao)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
