import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:tollxpress/core/common/widgets/gradient_background.dart';
import 'package:tollxpress/core/res/fonts.dart';
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
          children: [
            const ProfileHeader(),
            Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 10),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                padding: const EdgeInsets.all(15),
                height: 100,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      MediaRes.wallet,
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(width: 15),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Solde wallet'),
                        Text(
                          "2547.35",
                          style: TextStyle(
                            fontSize: 35,
                            fontFamily: Fonts.poppins,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Activités Récentes :",
              style: TextStyle(
                fontSize: 22,
                fontFamily: Fonts.poppins,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
