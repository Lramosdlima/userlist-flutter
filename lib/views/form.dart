import 'package:flutter/material.dart';
import 'package:userlist/views/user_list.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
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
                validator: (value) => validation(value),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "CPF"),
                validator: (value) => validation(value),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Email"),
                validator: (value) => validation(value),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Senha"),
                validator: (value) => validation(value),
                obscureText: true,
              ),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: "Confirmação de Senha"),
                validator: (value) => validation(value),
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

validation(value) {
  if (value == null || value.isEmpty) {
    return 'Preencha o campo';
  }
  return null;
}
