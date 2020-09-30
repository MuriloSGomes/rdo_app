import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smart_rdo/services/atividade_service.dart';



class AgendaScreen2 extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Atividade>>(
      future: _fetchAtividades(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          List<Atividade> data = snapshot.data;
          return _atividadesListView(data);
        }else if(snapshot.hasError){
          return Text("${snapshot.error}");
        }
        return Center(child: CircularProgressIndicator());
      },
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

ListView _atividadesListView(data) {
  return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return _tile(data[index].nome, Icons.work);
      });
}

ListTile _tile(String title, IconData icon) => ListTile(
  title: Text(title,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,
      )),
  leading: Icon(
    icon,
    color: Colors.blue,
  ),
);
