import 'package:help_projeto/models/avaliacaoModel.dart';
import 'package:help_projeto/models/servicoModel.dart';
import 'package:help_projeto/pages/AutonomoPage/Widgets/avaliacao.dart';

import '../models/autonomoModel.dart';

final autonomosData = [
  AutonomoModel(
      id: '1',
      nomeCompleto: 'Maria da Costa Santos',
      sobre:
          'Sou costureira há mais de 20 anos, apaixonada por criar e desenhar novas roupas pois sei que e meu ponto forte, mas também realizo trabalhos como concertos de peças, bainhas e ajustes muito bem e com ótimos acabamentos nas roupas. Sou sempre elogiada pela minha organização com as entregas e compromisso com as clientes',
      profissao: 'Costureira',
      idCategoria: '2',
      urlPerfil: 'assets/maria.jpeg',
      estrelas: 4.8,
      servico: [
        ServicoModel(
          id: '1',
          idAutonomo: '1',
          titulo: 'Bainha Simples',
          descricao:
              ' A bainha simples corresponde a bainha em roupas com tecidos simples....',
          urlImagem: 'assets/bainhaSImples.jpg',
          valor: 10.00,
        ),
        ServicoModel(
          id: '2',
          idAutonomo: '1',
          titulo: 'Bainha Delicada',
          urlImagem: 'assets/bainhaDelicada.jpg',
          descricao:
              ' Essa corresponde a bainha em roupas com tecidos mais delicados, como vestidos de festa, roupas de ceda, entre outras....',
          valor: 20.00,
        ),
        ServicoModel(
          id: '3',
          idAutonomo: '1',
          titulo: 'Concertos e reparos',
          descricao: 'Concertar pecas com rasgos, furos',
          urlImagem: 'assets/concertos.jpg',
          valor: 5.00,
        ),
        ServicoModel(
          id: '4',
          idAutonomo: '1',
          titulo: 'Troca de Zíper',
          descricao:
              'Conserto, reforço e troca de zíper com rapidez e acabamento de alta qualidade.',
          urlImagem: 'assets/ziper.jpeg',
          valor: 10.00,
        ),
        ServicoModel(
          id: '5',
          idAutonomo: '1',
          titulo: 'Serviços de bordado',
          descricao:
              'O servico de bordado é customizavel, ou seja seré de acordo com o que for combinado',
          urlImagem: 'assets/ziper.jpeg',
          valor: 0.00,
        ),
        ServicoModel(
          id: '6',
          idAutonomo: '1',
          titulo: 'Ajustes sob medida',
          descricao:
              'Ajustar aquela roupa que esta larga ou que precisa de um caimento melhor',
          urlImagem: 'assets/ajuste.jpg',
          valor: 12.00,
        ),
      ],
      avaliacao: [
        AvaliacaoModel(
            userName: 'Layna Diepes',
            idAutonomo: '3',
            userProfileImage: 'assets/layna.jpeg',
            comentario:
                'Serviço excelente realizado pela Maria. Tive que arrumar um vestido de festa de ultima hora e ela fez a bainha perfeitamente, nem parece que o vestido foi ajustado. Além da atenção que teve ao me atender ',
            estrelas: 5,
            data: '20/08/2022'),
        AvaliacaoModel(
            userName: 'Lohana Malini',
            idAutonomo: '3',
            userProfileImage: 'assets/lohana.jpeg',
            urlImagem: 'assets/vestido.pnj',
            comentario:
                'Tinha um vestido que queria muuito para uma festa, e a maria fez exatamente igual a foto que mandei, estou apaixonada por ele. Nao largo mais a maria como costureira rsrsrs',
            estrelas: 5,
            data: '10/08/2022'),
      ]),
  AutonomoModel(
      id: '2',
      nomeCompleto: 'José Reis da Silva',
      sobre:
          'Ja tive experiência na área de instalações elétricas de baixa e média tensão na indústria naval, papel & celulose, petroquímica, plantas químicas e predial. Atualmente trabalho como autonomo para pequenas instalacoes domesticas, mas devido ao meu conhecimento realizo um servico de excelencia, desde a instalacao de lampadas ate troca de fiacao de toda a residencia',
      idCategoria: '3',
      profissao: 'Eletricista',
      urlPerfil: 'assets/jose.jpeg',
      estrelas: 4.9,
      servico: [
        ServicoModel(
          id: '1',
          idAutonomo: '2',
          titulo: 'Troca de lampadas',
          descricao: ' ',
          urlImagem: 'assets/lampada.jpeg',
          valor: 10.00,
        ),
        ServicoModel(
          id: '2',
          idAutonomo: '2',
          titulo: 'Verificar fiação',
          urlImagem: 'assets/fiacao.jpeg',
          descricao: 'Sua conta de lus esta vindo alta demais?...',
          valor: 20.00,
        ),
      ],
      avaliacao: [
        AvaliacaoModel(
            userName: 'Luiz Silva',
            idAutonomo: '3',
            userProfileImage: 'assets/lohana.jpeg',
            urlImagem: 'assets/vestido.pnj',
            comentario:
                'Tinha um vestido que queria muuito para uma festa, e a maria fez exatamente igual a foto que mandei, estou apaixonada por ele. Nao largo mais a maria como costureira rsrsrs',
            estrelas: 5,
            data: '10/08/2022'),
        AvaliacaoModel(
            userName: 'Leticia paiva',
            idAutonomo: '3',
            userProfileImage: 'assets/lohana.jpeg',
            urlImagem: 'assets/vestido.pnj',
            comentario:
                'Tinha um vestido que queria muuito para uma festa, e a maria fez exatamente igual a foto que mandei, estou apaixonada por ele. Nao largo mais a maria como costureira rsrsrs',
            estrelas: 5,
            data: '10/08/2022'),
      ]),
  AutonomoModel(
      id: '3',
      nomeCompleto: 'Luana Alves Pereira',
      sobre:
          'Desde pequena sou apaixonada pela área da beleza, com 18 anos comecei minha carreira e atualmente com 7 anos de carreira possuo grande experiência com atendimento a todo tipo de público. Foco principal em coloração e a expressão individual e criativa de cliente, mantendo sempre a saúde e integridade dos fios.',
      urlPerfil: 'assets/luana.jpeg',
      profissao: 'Cabelereira',
      idCategoria: '1',
      estrelas: 4.5,
      servico: [
        ServicoModel(
          id: '1',
          idAutonomo: '3',
          titulo: 'Escova com modelagem',
          descricao: 'Escova com modelacao dos fios',
          urlImagem: 'assets/escova.jpeg',
          valor: 100.00,
        ),
        ServicoModel(
          id: '2',
          idAutonomo: '3',
          titulo: 'Corte',
          descricao: 'Corte como vc quiser',
          urlImagem: 'assets/corte.jpg',
          valor: 60.00,
        ),
        ServicoModel(
          id: '3',
          idAutonomo: '3',
          titulo: 'Luzes',
          descricao: 'Corte como vc quiser',
          urlImagem: 'assets/luzes.jpeg',
          valor: 300.00,
        ),
        ServicoModel(
          id: '4',
          idAutonomo: '3',
          titulo: 'Hidratação',
          descricao: 'Corte como voce quiser',
          urlImagem: 'assets/hidratacao.jpeg',
          valor: 60.00,
        ),
      ],
      avaliacao: [
        AvaliacaoModel(
            userName: 'Luiz Silva',
            idAutonomo: '3',
            userProfileImage: 'assets/lohana.jpeg',
            urlImagem: 'assets/vestido.pnj',
            comentario:
                'Tinha um vestido que queria muuito para uma festa, e a maria fez exatamente igual a foto que mandei, estou apaixonada por ele. Não largo mais a maria como costureira rsrsrs',
            estrelas: 5,
            data: '10/08/2022'),
        AvaliacaoModel(
            userName: 'Leticia paiva',
            idAutonomo: '3',
            userProfileImage: 'assets/lohana.jpeg',
            urlImagem: 'assets/vestido.pnj',
            comentario:
                'Tinha um vestido que queria muuito para uma festa, e a maria fez exatamente igual a foto que mandei, estou apaixonada por ele. Não largo mais a maria como costureira rsrsrs',
            estrelas: 5,
            data: '10/08/2022'),
      ]),
];
