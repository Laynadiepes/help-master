import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:help_projeto/models/agendamentoModel.dart';
import 'package:help_projeto/pages/AgendamentosPage/widgets/cardAgendamentoResumo.dart';
import 'package:help_projeto/utils/constants.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../models/agendamentoService.dart';
import '../../../utils/routes.dart';

class ReagendamentoDialog extends StatefulWidget {
  const ReagendamentoDialog({required this.agendamento, Key? key})
      : super(key: key);

  final AgendamentoModel agendamento;

  void _showDialogConfirmarReagendamento(BuildContext context,
      AgendamentoModel agendamento, AgendamentoService provider) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text("Selecione nova data/hora"),
              actions: <Widget>[
                ReagendamentoDialog(
                  agendamento: agendamento,
                ),
                TextButton(
                  onPressed: () {
                    provider.confirmarAgendamento(agendamento);
                    Navigator.of(context)..popAndPushNamed(Routes.home);
                  },
                  child: Text("Confirmar"),
                )
              ]);
        });
  }

  @override
  State<ReagendamentoDialog> createState() => _ReagendamentoDialogState();
}

class _ReagendamentoDialogState extends State<ReagendamentoDialog> {
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
    final AgendamentoService agendamento = Provider.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Data: ${DateFormat(' d/MM/yyyy    ').format(widget.agendamento.dataHora)}",
                    style: const TextStyle(fontSize: 16, color: primary),
                  ),
                  Text(
                    "Hora: ${DateFormat(' hh:mm    ').format(widget.agendamento.dataHora)}",
                    style: const TextStyle(fontSize: 16, color: primary),
                  ),
                ],
              ),
              IconButton(
                hoverColor: primary,
                onPressed: () => _selectDateTime(context).then((value) {
                  var novoAgendamento = agendamento.alterarAgendamento(
                    widget.agendamento,
                    dateTime,
                  );
                  widget._showDialogConfirmarReagendamento(
                      context, novoAgendamento, agendamento);
                }),
                icon: const Icon(Icons.calendar_month),
                iconSize: 40,
                color: textColor,
              ),
            ],
          ),
        )
      ],
    );
  }
}
