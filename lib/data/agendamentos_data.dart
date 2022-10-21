import 'package:help_projeto/models/agendamentoModel.dart';
import 'package:intl/intl.dart';

import '../models/servicoModel.dart';

final agendamentosData = [
  AgendamentoModel(
    idAgendamento: '3',
    servicoAgendado: ServicoModel(
      id: '1',
      idAutonomo: '1',
      titulo: 'Bainha Simples',
      descricao:
          ' A bainha simples corresponde a bainha em roupas com tecidos simples....',
      urlImagem: 'assets/bainhaSImples.jpg',
      valor: 10.00,
    ),
    dataHora: DateTime.now(),
  ),
  AgendamentoModel(
    idAgendamento: '4',
    servicoAgendado: ServicoModel(
      id: '5',
      idAutonomo: '1',
      titulo: 'Serviços de bordado',
      descricao:
          'O serviço de bordado é customizável, ou seja sera de acordo com o que for combinado',
      urlImagem: 'assets/ziper.jpeg',
      valor: 0.00,
    ),
    dataHora: DateTime.now(),
  ),
  AgendamentoModel(
    idAgendamento: '5',
    servicoAgendado: ServicoModel(
      id: '2',
      idAutonomo: '2',
      titulo: 'Verificar fiação',
      urlImagem: 'assets/fiacao.jpeg',
      descricao: 'Sua conta de luz esta vindo alta demais?...',
      valor: 20.00,
    ),
    dataHora: DateTime.now(),
  ),
  AgendamentoModel(
    idAgendamento: '6',
    servicoAgendado: ServicoModel(
      id: '1',
      idAutonomo: '3',
      titulo: 'Escova com modelagem',
      descricao: 'Escova com modelação dos fios',
      urlImagem: 'assets/escova.jpeg',
      valor: 100.00,
    ),
    dataHora: DateTime.now(),
  ),
  AgendamentoModel(
    idAgendamento: '7',
    servicoAgendado: ServicoModel(
      id: '4',
      idAutonomo: '3',
      titulo: 'Hidratação',
      descricao: 'Corte como você quiser',
      urlImagem: 'assets/hidratacao.jpeg',
      valor: 60.00,
    ),
    dataHora: DateTime.now(),
  ),
];

final agendamentosFinalizadosData = [
  AgendamentoModel(
    idAgendamento: '1',
    servicoAgendado: ServicoModel(
      id: '1',
      idAutonomo: '1',
      titulo: 'Bainha Simples',
      descricao:
          ' A bainha simples corresponde a bainha em roupas com tecidos simples....',
      urlImagem: 'assets/bainhaSImples.jpg',
      valor: 10.00,
    ),
    dataHora: DateTime(2022, 10, 20, 10, 30),
  ),
  AgendamentoModel(
    idAgendamento: '2',
    servicoAgendado: ServicoModel(
      id: '5',
      idAutonomo: '1',
      titulo: 'Serviços de bordado',
      descricao:
          'O servico de bordado e customizavel, ou seja sera de acordo com o q for combinado',
      urlImagem: 'assets/ziper.jpeg',
      valor: 0.00,
    ),
    dataHora: DateTime(2022, 11, 04, 11, 00),
  ),
];
