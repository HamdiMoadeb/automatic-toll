import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tollxpress/core/common/widgets/popup_item.dart';
import 'package:tollxpress/core/extensions/context_extension.dart';
import 'package:tollxpress/core/res/colours.dart';
import 'package:tollxpress/core/services/injection_container.dart';
import 'package:tollxpress/feature/auth/presentation/manager/bloc/auth_bloc.dart';
import 'package:tollxpress/feature/profile/presentation/pages/edit_profile_screen.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Profil',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 24,
        ),
      ),
      actions: [
        PopupMenuButton(
          offset: const Offset(0, 50),
          icon: const Icon(Icons.more_horiz),
          surfaceTintColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          itemBuilder: (context) => [
            PopupMenuItem<void>(
              child: const PopupItem(
                title: 'Modifier profil',
                icon: Icon(
                  Icons.edit_outlined,
                  color: Colours.neutralTextColour,
                ),
              ),
              onTap: () => context.push(
                BlocProvider(
                  create: (_) => serviceLocator<AuthBloc>(),
                  child: const EditProfileScreen(),
                ),
              ),
            ),
            const PopupMenuItem<void>(
              child: PopupItem(
                title: 'Notification',
                icon: Icon(
                  Icons.notifications_none,
                  color: Colours.neutralTextColour,
                ),
              ),
            ),
            const PopupMenuItem<void>(
              child: PopupItem(
                title: 'Aide',
                icon: Icon(
                  Icons.help_outline_outlined,
                  color: Colours.neutralTextColour,
                ),
              ),
            ),
            PopupMenuItem<void>(
              height: 1,
              padding: EdgeInsets.zero,
              child: Divider(
                height: 1,
                color: Colors.grey[300],
                endIndent: 16,
                indent: 16,
              ),
            ),
            PopupMenuItem<void>(
              child: const PopupItem(
                title: 'Se déconnecter',
                icon: Icon(
                  Icons.logout_rounded,
                  color: Colors.black,
                ),
              ),
              onTap: () async {
                final navigator = Navigator.of(context);
                unawaited(
                  navigator.pushNamedAndRemoveUntil(
                    '/',
                    (route) => false,
                  ),
                );
              },
            ),
          ],
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
