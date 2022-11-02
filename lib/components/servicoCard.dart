import 'package:flutter/material.dart';
import 'package:help_projeto/models/servicosFavService.dart';
import 'package:provider/provider.dart';

import '../models/agendamentoService.dart';
import '../models/servicoModel.dart';
import '../utils/constants.dart';
import '../utils/routes.dart';

class ServicoCard extends StatefulWidget {
  ServicoCard({Key? key}) : super(key: key);

  @override
  State<ServicoCard> createState() => _ServicoCardState();
}

class _ServicoCardState extends State<ServicoCard> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime dateTime = DateTime.now();

  // Select for Date
  Future<DateTime> _selectDate(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
      });
    }
    return selectedDate;
  }

// Select for Time
  Future<TimeOfDay> _selectTime(BuildContext context) async {
    final selected = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (selected != null && selected != selectedTime) {
      setState(() {
        selectedTime = selected;
      });
    }
    return selectedTime;
  }

  Future _selectDateTime(BuildContext context) async {
    final date = await _selectDate(context);
    if (date == null) return;

    final time = await _selectTime(context);

    if (time == null) return;
    setState(() {
      dateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final servico = Provider.of<ServicoModel>(context);
    final favoritaServico = Provider.of<ServicoService>(context);
    final AgendamentoService agendamento = Provider.of(context);

    return Card(
      shadowColor: subTextColor,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(
                    height: 60,
                    fit: BoxFit.cover,
                    image: AssetImage(
                      servico.urlImagem,
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 6,
              fit: FlexFit.tight,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      servico.titulo,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      servico.descricao,
                      style: const TextStyle(
                        color: textColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'R\$ ' + servico.valor.toString(),
                          style: const TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: IconButton(
                onPressed: (() => _selectDateTime(context).then((value) =>
                    Navigator.of(context).pushNamed(
                        Routes.confirmacaoAgendamento,
                        arguments:
                            agendamento.criarAgendamento(dateTime, servico)))),
                color: subTextColor,
                focusColor: primary,
                icon: Icon(Icons.calendar_month),
              ),
            ),
            IconButton(
              onPressed: () {
                servico.toggleFavorite();
                if (servico.isFavorite) {
                  favoritaServico.addServicoFavorito(servico);
                } else {
                  favoritaServico.removeServicoFavorito(servico.id);
                }
              },
              color: subTextColor,
              icon: servico.isFavorite
                  ? const Icon(Icons.favorite)
                  : const Icon(Icons.favorite_border),
            )
          ],
        ),
      ),
    );
  }
}
