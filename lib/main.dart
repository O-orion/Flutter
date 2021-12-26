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
        body:
            transferencia(), //criando nossa classe responsavel pelo widget de card
      ), //Indicando uma tela para o material design abri / tela home
    );
  }
}

class formularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoValor = TextEditingController();
  final TextEditingController _controladorCampoConta = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Jesus Cristo é o meu Senhor!")),
        body: Column(
          children: [
            editor(
                controlador: this._controladorCampoConta,
                hint: "1001",
                rotulo: "Número conta"),
            editor(
              controlador: this._controladorCampoValor,
              hint: "10.00",
              rotulo: "Valor",
              icone: Icons.monetization_on,
            ),
            ElevatedButton(
              onPressed: () {
                _criaTransferencia(context);
              },
              child: Text("Salvar"),
            )
          ],
        ));
  }

  void _criaTransferencia(BuildContext context) {
    final int? valor = int.tryParse(_controladorCampoValor.text);
    final int? conta = int.tryParse(_controladorCampoConta.text);
    if (valor != null && conta != null) {
      final transferenciaCriada = dadosTransferencia(valor, conta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}

class editor extends StatelessWidget {
  final TextEditingController controlador;
  final String hint;
  final String rotulo;
  final IconData? icone;

  editor(
      {required this.controlador,
      required this.hint,
      required this.rotulo,
      this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
            icon: icone != null ? Icon(icone) : null,
            labelText: rotulo,
            hintText: hint),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class transferencia extends StatelessWidget {
  final List<dadosTransferencia> _transferencias = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    _transferencias.add(dadosTransferencia(1000, 555));
    return Scaffold(
      appBar: AppBar(
        title: Text("JESUS CRISTO É O SENHOR!"),
      ),
      //Adicionando um appBar em nosso aplicativo
      body: ListView.builder(
        itemCount: _transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = _transferencias[indice];
          return cardTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<dadosTransferencia?> future = Navigator.push(context, MaterialPageRoute(builder: (context) {
            return formularioTransferencia(); //retornando a pagina de formulário
          }));
          future.then((transferencia) => _transferencias.add(transferencia!));
        },
        child: Icon(Icons.add),
      ),
    ); //Corpo do nosso app
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
    ));
  }
}

class dadosTransferencia {
  final int valor;
  final int numeroConta;

  dadosTransferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'dadosTransferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}
