// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userlist/models/user.dart';
import 'package:userlist/provider/user.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _loadFormData(User? user) {
    if (user != null) {
      _formData['id'] = user.id.toString();
      _formData['name'] = user.name.toString();
      _formData['email'] = user.email != null ? user.email.toString() : '';
      _formData['avatarUrl'] =
          user.avatarUrl != null ? user.avatarUrl.toString() : '';
    }
  }

  UserForm({super.key});

  @override
  Widget build(BuildContext context) {
    final User? user = ModalRoute.of(context)!.settings.arguments as User?;

    _loadFormData(user);

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

                  Provider.of<Users>(context, listen: false).put(
                    User(
                      id: _formData['id'].toString(),
                      name: _formData['name'].toString(),
                      email: _formData['email'].toString(),
                      avatarUrl: _formData['avatarUrl'].toString(),
                    ),
                  );

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
                profileImage(_formData['avatarUrl']),
                TextFormField(
                  initialValue: _formData['name'],
                  decoration: const InputDecoration(labelText: 'Nome'),
                  validator: (value) => validateName(value),
                  onSaved: (value) => _formData['name'] = value!,
                ),
                TextFormField(
                  initialValue: _formData['email'],
                  decoration: const InputDecoration(labelText: 'E-mail'),
                  validator: (value) => validateEmail(value),
                  onSaved: (value) => _formData['email'] = value!,
                ),
                TextFormField(
                  initialValue: _formData['avatarUrl'],
                  decoration: const InputDecoration(labelText: 'URL do Avatar'),
                  validator: (value) => validateAvatarUrl(value),
                  onSaved: (value) => _formData['avatarUrl'] = value!,
                ),
              ],
            ),
          ),
        ));
  }
}

profileImage(avatarUrl) {
  if (avatarUrl == null || avatarUrl.isEmpty) {
    return const CircleAvatar(radius: 85, child: Icon(Icons.person, size: 85));
  }

  if (avatarUrl.startsWith('assets')) {
    return CircleAvatar(
      radius: 85,
      backgroundColor: Colors.deepPurple,
      child: CircleAvatar(
        radius: 80,
        backgroundImage: Image.asset(avatarUrl).image,
      ),
    );
  }

  if (avatarUrl.startsWith('http')) {
    return CircleAvatar(
      radius: 85,
      backgroundColor: Colors.deepPurple,
      child: CircleAvatar(
        radius: 80,
        backgroundImage: NetworkImage(avatarUrl),
      ),
    );
  }

  return const CircleAvatar(radius: 85, child: Icon(Icons.person, size: 85));
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
  if (!value.startsWith('http') && !value.startsWith('assets')) {
    return 'Url inválida. Deve conter http:// ou https://';
  }
  return null;
}
