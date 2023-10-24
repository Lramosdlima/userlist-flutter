import 'package:flutter/material.dart';
import 'package:userlist/views/user_list.dart';

class FormPage extends StatelessWidget {
  const FormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cadastro"),
        ),
        body: Form(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: "Nome"),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "CPF"),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Email"),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Senha"),
                obscureText: true,
              ),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: "Confirmação de Senha"),
                obscureText: true,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const UserList()),
                  );
                },
                child: const Text("Salvar"),
              )
            ],
          ),
        ));
  }
}
