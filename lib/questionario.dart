import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoResponder;

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.quandoResponder
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : [];

    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]['texto'].toString()), //Convertendo para String
        ...respostas
            .map((resp) {
              /** Retorna o Objeto Resposta */
              return Resposta(  /** Passando como parâmetro */
                resp['texto'].toString(), /** o texto */
                () => quandoResponder(int.parse(resp['pontuacao'].toString())), /** a função [arrow function] que executa a função (quandoSelecionado) recebendo o número da pontuacao como argumento */
              );
            }).toList(), //Retorna uma lista
      ],
    );
  }
}
