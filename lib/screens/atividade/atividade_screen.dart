import 'package:flutter/material.dart';
import 'package:smart_rdo/screens/fiscal/fiscal_screen.dart';
import 'package:smart_rdo/widgets/time_picker.dart';
import 'package:smart_rdo/widgets/image_picker_custom.dart';

class AtividadeScreen extends StatefulWidget {
  @override
  _AtividadeScreenState createState() => _AtividadeScreenState();
}

class _AtividadeScreenState extends State<AtividadeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 20,
        title: const Text(
          'Atividades',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) => AreaItem(data[index]),
        itemCount: data.length,
      ),
    );
  }
}

//Dados Mocados
final List<Area> data = <Area>[
  Area(1, "Roberto"),
  Area(2, "Claudio"),
  Area(3, "Giovani")
];

class Area {
  Area(this.id, this.nomeResponsavel);

  final int id;
  final String nomeResponsavel;
}

class AreaItem extends StatelessWidget {
  AreaItem(this.area);

  final Area area;

  Widget _buildTile(Area root, BuildContext context) {
    if (root.nomeResponsavel.isEmpty)
      return ListTile(title: Text(root.id.toString()));

    return ExpansionTile(
      title: Text("Area ${root.id} - ${root.nomeResponsavel}"),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text('Período de Atuação'),
              Row(
                children: <Widget>[
                  TimePicker(timeInicial: 'Inicial'),
                  Text(' - '),
                  TimePicker(timeInicial: 'Final'),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
              ),
              Text('Descrição'),
              TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Descrição resumida do que foi feito na área',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: ImagePickerCustom(),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: RaisedButton.icon(
                  onPressed: () => {
                  _showDialog(context)
                },
                  icon: Icon(Icons.check),
                  label: Text('Confirmar'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTile(area, context);
  }
}

void _showDialog(context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Atividade enviada com sucesso!", style: TextStyle(color: Colors.green,fontSize: 20)),
          actions: <Widget>[
            FlatButton(
              child: Text("Ok",style: TextStyle(color: Colors.black),),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FiscalPage()),
                );
              },
            )
          ],
        );
      });
}
