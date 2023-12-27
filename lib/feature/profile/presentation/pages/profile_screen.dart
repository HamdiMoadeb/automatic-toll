import 'package:flutter/material.dart';
import 'package:tollxpress/core/common/widgets/gradient_background.dart';
import 'package:tollxpress/core/res/media_res.dart';
import 'package:tollxpress/feature/profile/presentation/widgets/profile_app_bar.dart';
import 'package:tollxpress/feature/profile/presentation/widgets/profile_header.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: const ProfileAppBar(),
      body: GradientBackground(
        image: MediaRes.profileGradientBackground,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: const [
            ProfileHeader(),
          ],
        ),
      ),
    );
  }
}
