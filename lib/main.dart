import 'package:flutter/material.dart';

void main() {
  print("JESUS CRISTO É O SENHOR");
  runApp(byteBankApp()); //Importando o Material design MaterialApp()
}

//Criando uma classe para nosso aplicativo, assim ativando hot reaload
class byteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: formularioTransferencia(), //criando nossa classe responsavel pelo widget de card
      ), //Indicando uma tela para o material design abri / tela home
    );
  }
}

class formularioTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Jesus Cristo é o meu Senhor!")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              style: TextStyle(
                fontSize: 24.0
              ),
              decoration: InputDecoration(
                labelText: "Número conta",
                hintText: "0000"
            ),
            keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              style: TextStyle(
                fontSize: 24.0
              ),
              decoration: InputDecoration(
                icon: Icon(Icons.monetization_on),
                labelText: "Valor",
                hintText: "00.00"
            ),
            keyboardType: TextInputType.number,
            ),
          ),

          ElevatedButton(onPressed: (){}, child: Text("Salvar"))
        ],
      )
    );
  }
}

class transferencia extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("JESUS CRISTO É O SENHOR!"),), //Adicionando um appBar em nosso aplicativo
      body: Column(
        children: [
          cardTransferencia(dadosTransferencia(100,2001)),
          cardTransferencia(dadosTransferencia(400,2001)),
          cardTransferencia(dadosTransferencia(200,2001)),
          cardTransferencia(dadosTransferencia(300,2001)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: Icon(Icons.add),
      ),
    );//Corpo do nosso app
  }
}

class cardTransferencia extends StatelessWidget {
  final dadosTransferencia _transferenciaDados;

  cardTransferencia(this._transferenciaDados);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Card(
       child: ListTile(
         leading: Icon(Icons.monetization_on),
         title: Text(_transferenciaDados.valor.toString()),
         subtitle: Text(_transferenciaDados.numeroConta.toString()),
       )
   );
  }
}

class dadosTransferencia {
  final int valor;
  final int numeroConta;

  dadosTransferencia(this.valor, this.numeroConta);
}