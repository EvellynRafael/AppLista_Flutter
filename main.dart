import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Contato> contatos = [];

  @override
  void initState() {
    super.initState();
    contatos.add(new Contato(
        nome: "João", telefone: "95544-1010", tipo: ContatoType.CELULAR));

    contatos.add(new Contato(
        nome: "Maria", telefone: "99789-2020", tipo: ContatoType.CELULAR));

    contatos.add(new Contato(
      nome: "Carla", telefone: "98798-1111", tipo: ContatoType.FAVORITO));

    contatos.add(new Contato(
        nome: "Emelly", telefone: "98645-2222", tipo: ContatoType.FAVORITO));

    contatos.add(new Contato(
        nome: "Sidney", telefone: "93378-3333", tipo: ContatoType.CASA));

    contatos.add(new Contato(
        nome: "Zaya", telefone: "95484-4444", tipo: ContatoType.CASA));

    contatos.add(new Contato(
        nome: "Toquinho", telefone: "96578-5555", tipo: ContatoType.TRABALHO));

    contatos.add(new Contato(
        nome: "Maria", telefone: "97459-6666", tipo: ContatoType.TRABALHO));

    contatos.sort((a, b) =>a.nome.compareTo(b.nome));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: ListView.separated //ver o corpo em formato de lista
          (itemBuilder: (context, index) {
            var contato = contatos[index]; //criou a variável contato para depois inserir ela dentro do index e retornar na page
            return ListTile(
              leading: CircleAvatar( //incluir icone a esquerda
                child: ContatoHelper.getIconByContatoType(contato.tipo),
                backgroundColor: Colors.blue[200],
              ),
                title: Text(contato.nome),
                subtitle: Text(contato.telefone),
                trailing: IconButton(
                  icon: Icon(Icons.call),
                  onPressed: () => {},
                ),
            );
      },
          separatorBuilder: (context, index) => Divider(),
          itemCount: contatos.length)
    );
  }
}

class Contato {
  final String nome;
  final String telefone;
  final ContatoType tipo;

  Contato({required this.nome, required this.telefone, required this.tipo});

}

enum ContatoType { CELULAR, TRABALHO, FAVORITO, CASA }

class ContatoHelper { //criar contato de acordo com o ícone
  static Icon getIconByContatoType(ContatoType tipo){
    switch (tipo){
      case ContatoType.CELULAR:
        return Icon(Icons.phone_android, color: Colors.green[700]);
      case ContatoType.TRABALHO:
        return Icon(Icons.work, color: Colors.blueAccent[700]);
      case ContatoType.FAVORITO:
        return Icon(Icons.star, color: Colors.yellow[700]);
      case ContatoType.CASA:
        return Icon(Icons.home, color: Colors.purple[700]);
    }
  }
}