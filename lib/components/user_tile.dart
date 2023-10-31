import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userlist/models/user.dart';
import 'package:userlist/provider/user.dart';
import 'package:userlist/routes/app_routes.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final CircleAvatar avatar;

    avatar = avatarImage(user.avatarUrl);

    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: emailText(user.email),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () => editUser(context, user),
              color: Theme.of(context).primaryColor,
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () => deleteUser(context, user),
              color: Theme.of(context).primaryColor,
              icon: const Icon(Icons.delete),
            )
          ],
        ),
      ),
    );
  }
}

editUser(context, user) {
  Navigator.of(context).pushNamed(
    AppRoutes.USER_FORM,
    arguments: user,
  );
}

deleteUser(context, user) {
  showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
            title: const Text("Excluir Usuário"),
            content: const Text("Tem certeza que deseja excluir esse usuário?"),
            actions: [
              TextButton(
                child: const Text("Não"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text("SIM", style: TextStyle(color: Colors.red)),
                onPressed: () {
                  Provider.of<Users>(context, listen: false).remove(user);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ));
}

avatarImage(avatarUrl) {
  if (avatarUrl == null || avatarUrl!.isEmpty) {
    return const CircleAvatar(child: Icon(Icons.person));
  } else if (avatarUrl.startsWith('http')) {
    return CircleAvatar(backgroundImage: NetworkImage(avatarUrl));
  } else {
    return CircleAvatar(backgroundImage: Image.asset(avatarUrl!).image);
  }
}

emailText(email) {
  if (email == null) {
    return const Text(
      'Email não identificado',
      style: TextStyle(color: Colors.red),
    );
  } else {
    return Text(email.toString());
  }
}
