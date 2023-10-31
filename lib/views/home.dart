import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromARGB(255, 229, 150, 243),
              Color.fromARGB(255, 223, 214, 238),
              Color.fromARGB(255, 204, 185, 255),
              Color.fromARGB(255, 220, 141, 235),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            height: MediaQuery.of(context).size.height),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Bem vindo!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                const Icon(Icons.crisis_alert_outlined,
                    size: 100, color: Colors.purple),
                const Text(
                  "Projeto Flutterrível",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.purple,
                      fontFamily: 'georgia'),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      elevation: 8,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/user-list');
                    },
                    child: const Text('Ir para a lista de usuários',
                        style: TextStyle(fontSize: 20))),
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
