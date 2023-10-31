import 'package:flutter/material.dart';
import 'package:userlist/models/user.dart';
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
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.USER_FORM,
                  arguments: user,
                );
              },
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
