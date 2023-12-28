import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tollxpress/core/common/app/providers/user_provider.dart';
import 'package:tollxpress/core/extensions/context_extension.dart';
import 'package:tollxpress/core/res/colours.dart';
import 'package:tollxpress/core/res/media_res.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (_, provider, __) {
        final user = provider.user;
        final image = user?.profilePic == null || user!.profilePic!.isEmpty
            ? null
            : user.profilePic;
        return Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: image != null && image.isNotEmpty
                  ? NetworkImage(image)
                  : const AssetImage(MediaRes.user) as ImageProvider,
            ),
            const SizedBox(height: 16),
            Text(
              user?.fullName ?? 'No User',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
            if (user?.email != null && user!.email.isNotEmpty) ...[
              const SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.width * .15),
                child: Text(
                  user.email,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colours.neutralTextColour,
                  ),
                ),
              )
            ],
            const SizedBox(
              height: 16,
            )
          ],
        );
      },
    );
  }
}