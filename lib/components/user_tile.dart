import 'package:flutter/material.dart';
import 'package:userlist/models/user.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final CircleAvatar avatar;
    if (user.avatarUrl == null || user.avatarUrl!.isEmpty) {
      avatar = const CircleAvatar(child: Icon(Icons.person));
    } else {
      avatar =
          CircleAvatar(backgroundImage: Image.asset(user.avatarUrl!).image);
    }
    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: user.email == null
          ? const Text(
              'Email não identificado',
              style: TextStyle(color: Colors.red),
            )
          : Text(user.email.toString()),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              color: Theme.of(context).primaryColor,
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () {},
              color: Theme.of(context).primaryColor,
              icon: const Icon(Icons.delete),
            )
          ],
        ),
      ),
    );
  }
}
