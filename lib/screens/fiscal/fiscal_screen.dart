import 'package:emoji_feedback/emoji_feedback.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dashed_container/dashed_container.dart';

class FiscalPage extends StatefulWidget {
  @override
  _FiscalPageState createState() => _FiscalPageState();
}

class _FiscalPageState extends State<FiscalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Avaliação da atividades',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: ListView(
              padding: EdgeInsets.all(10),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: RaisedButton(
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.all(0),
                    child: Container(
                      height: 230,
                      width: double.infinity,
                      padding:
                          EdgeInsets.only(left: 10.0, bottom: 8.0, top: 200),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/antes.png'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: RaisedButton(
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.all(0),
                    child: Container(
                      height: 230,
                      width: double.infinity,
                      padding:
                          EdgeInsets.only(left: 10.0, bottom: 8.0, top: 200),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/depois.png'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                Text(
                  'O que foi feito na área?',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                DashedContainer(
                  child: Container(
                    height: 230,
                    width: 390,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0)),
                    padding: EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy t'
                        'are like Aldus PageMaker including versions of Lorem Ipsum.',
                        style: TextStyle(fontSize: 19),
                      ),
                    ),
                  ),
                  dashColor: Colors.grey,
                  borderRadius: 10.0,
                  dashedLength: 30,
                  blankLength: 0,
                  strokeWidth: 2,
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          'Qual sua nota para a atividade feita?',
                          style: TextStyle(fontSize: 19),
                        ),
                      ),
                      Image.asset('assets/emojiFeedback.png'),
                      SizedBox(height: 20,),
                      RaisedButton(
                        padding: EdgeInsets.all(15),
                        color: Colors.white,
                        elevation: 20,
                        onPressed: () {
                            _showDialog(context);
                        },
                        child: Text(
                          'Enviar Feedback',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

void _showDialog(context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Feedback enviado com sucesso!", style: TextStyle(color: Colors.green,fontSize: 20)),
          actions: <Widget>[
            FlatButton(
              child: Text("Ok",style: TextStyle(color: Colors.black),),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      });
}
