// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  UserForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Formulário de Usuário'),
          actions: [
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                final isValid = _form.currentState!.validate();
                if (isValid) {
                  _form.currentState!.save();
                  Navigator.of(context).pop();
                }
              },
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _form,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Nome'),
                  validator: (value) => validateName(value),
                  onSaved: (value) {
                    print(value);
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'E-mail'),
                  validator: (value) => validateEmail(value),
                  onSaved: (value) {
                    print(value);
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'URL do Avatar'),
                  validator: (value) => validateAvatarUrl(value),
                  onSaved: (value) {
                    print(value);
                  },
                ),
              ],
            ),
          ),
        ));
  }
}

profileImage(avatarUrl) {
  if (avatarUrl == null || avatarUrl!.isEmpty) {
    return const CircleAvatar(child: Icon(Icons.person));
  } else if (avatarUrl.startsWith('http')) {
    return CircleAvatar(backgroundImage: NetworkImage(avatarUrl));
  } else {
    return CircleAvatar(backgroundImage: Image.asset(avatarUrl!).image);
  }
}

validateName(value) {
  if (value!.trim().isEmpty) {
    return 'Nome inválido';
  }
  if (value.trim().length < 3) {
    return 'Nome muito pequeno. No mínimo 3 letras.';
  }
  return null;
}

validateEmail(value) {
  if (value!.trim().isEmpty) {
    return 'E-mail inválido';
  }
  if (value.trim().length < 3) {
    return 'E-mail muito pequeno. No mínimo 3 letras.';
  }
  if (!value.contains('@')) {
    return 'E-mail inválido.';
  }
  return null;
}

validateAvatarUrl(value) {
  if (value!.trim().isEmpty) {
    return null;
  }
  if (!value.contains('http')) {
    return 'Url inválida. Deve conter http:// ou https://';
  }
  return null;
}
