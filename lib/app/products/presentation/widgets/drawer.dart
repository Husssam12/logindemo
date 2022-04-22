import 'package:design/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../app_manger/app_manger_bloc.dart';
import '../../../user/domain/entities/user.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User? user;

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 36.r,
                child: const FaIcon(FontAwesomeIcons.user),
              ),
              if (user != null)
                Column(
                  children: [
                    YouText.titleSmall(user!.name),
                    const RSizedBox.vertical(8),
                    YouText.bodySmall(user!.email),
                  ],
                )
            ],
          )),
          ListTile(
            title: const Text('Logout'),
            leading: Icon(
              FontAwesomeIcons.arrowRightFromBracket,
              color: themeData.colorScheme.onSurface,
            ),
            onTap: () {
              context.read<AppMangerBloc>().add(AppMangerLoggedOut());
            },
          )
        ],
      ),
    );
  }
}
