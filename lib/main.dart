// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 2},
        {'texto': 'Branco', 'pontuacao': 6},
        {'texto': 'Verde', 'pontuacao': 8},
        {'texto': 'Azul', 'pontuacao': 9},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': 10},
        {'texto': 'Leão', 'pontuacao': 2},
        {'texto': 'Cachorro', 'pontuacao': 6},
        {'texto': 'Tigre', 'pontuacao': 8},
        {'texto': 'Cobra', 'pontuacao': 9},
      ],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {'texto': 'Jose', 'pontuacao': 10},
        {'texto': 'Ademar', 'pontuacao': 2},
        {'texto': 'Leo', 'pontuacao': 6},
        {'texto': 'Bianca', 'pontuacao': 8},
        {'texto': 'Ricardo', 'pontuacao': 9},
      ],
    }
  ];
  bool get temPerguntaSelecionada {
    return perguntaSelecionada < _perguntas.length;
  }

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }

    print(_pontuacaoTotal);
  }

  void _reiniciarQQuestionario() {
    setState(() {
      perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Center(child: Text('Perguntas')),
          ),
          body: temPerguntaSelecionada
              ? Questionario(
                  perguntas: _perguntas,
                  perguntaSelecionada: perguntaSelecionada,
                  quandoResponder: _responder)
              : Resultado(_pontuacaoTotal, _reiniciarQQuestionario)),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
