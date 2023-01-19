import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:satari_pos/core/util/constant.dart';
import 'package:satari_pos/features/home/presentation/bloc/content_bloc.dart';
import 'package:satari_pos/features/home/presentation/bloc/content_event.dart';
import 'package:satari_pos/features/login/presentation/bloc/app_bloc.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
    final List<Map<String, dynamic>> menuOptions = [
      {
        'icon': Icons.menu_book,
        'title': 'Menu',
        'onTap': () {
          context.read<ContentBloc>().add(MenuEvent());
        },
      },
      {
        'icon': Icons.payments,
        'title': 'Bills',
        'onTap': () {
          context.read<ContentBloc>().add(BillEvent());
        },
      },
      {
        'icon': Icons.timeline,
        'title': 'Statistic',
        'onTap': () {
          context.read<ContentBloc>().add(StatisticEvent());
        },
      },
      {
        'icon': Icons.alarm_add,
        'title': 'Window Time',
        'onTap': () {
          context.read<ContentBloc>().add(WindowTimeEvent());
        },
      },
      {
        'icon': Icons.settings,
        'title': 'Settings',
        'onTap': () {
          context.read<ContentBloc>().add(SettingsEvent());
        },
      },
    ];

    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              child: Image.asset('assets/image/Asset 8.png'),
            ),
            ListView.builder(
              itemCount: menuOptions.length + 2,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                if (index < menuOptions.length) {
                  final option = menuOptions[index];
                  return InkWell(
                    onTap: option['onTap'],
                    highlightColor: Colors.amber[200],
                    splashColor: Colors.amber[200],
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    child: ListTile(
                      leading: Icon(option['icon']),
                      title: Text(option['title']),
                    ),
                  );
                } else if (index == menuOptions.length) {
                  return Divider(height: defaultPadding * 11);
                } else {
                  return InkWell(
                    onTap: () {
                      context.read<ContentBloc>().add(ProfileAccountEvent());
                    },
                    highlightColor: Colors.amber[200],
                    splashColor: Colors.amber[200],
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            const AssetImage('assets/image/profile_pic.png'),
                        backgroundColor: primaryColor,
                      ),
                      title: Text(
                        user.email ?? '',
                      ),
                    ),
                  );
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Log Out'),
              onTap: () => context.read<AppBloc>().add(AppLogoutRequested()),
            ),
          ],
        ),
      ),
    );
  }
}
