import 'dart:convert';

import 'package:http/http.dart' as http;

class Atividade {
  final String nome;

  Atividade({this.nome});

  factory Atividade.fromJson(Map<String, dynamic> json) {
    return Atividade(
        nome: json['nome']
    );
  }
}

Future<List<Atividade>> _fetchAtividades() async {

  final atividadesListAPIUrl = 'https://api.mocki.io/v1/fbf4241d';
  final resposta = await http.get(atividadesListAPIUrl);

  if (resposta.statusCode == 200) {
    List jsonResponse = json.decode(resposta.body);
    return jsonResponse.map((atividade) => new Atividade.fromJson(atividade)).toList();
  } else {
    throw Exception('Falha ao carregar as atividades');
  }
}