import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:tollxpress/core/res/colours.dart';
import 'package:tollxpress/feature/home/presentation/manager/providers/dashboard_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardController>(
      builder: (_, controller, child) {
        return Scaffold(
          body: IndexedStack(
            index: controller.currentIndex,
            children: controller.screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex,
            backgroundColor: Colors.white,
            selectedItemColor: Colours.primaryColour,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: false,
            unselectedLabelStyle: const TextStyle(color: Colors.grey),
            selectedLabelStyle: const TextStyle(color: Colours.primaryColour),
            elevation: 8,
            onTap: controller.changeIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.map_sharp,
                  color: controller.currentIndex == 0
                      ? Colours.primaryColour
                      : Colors.grey,
                ),
                label: 'Trajet',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.drive_eta,
                  color: controller.currentIndex == 1
                      ? Colours.primaryColour
                      : Colors.grey,
                ),
                label: 'Voiture',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.tap_and_play,
                  color: controller.currentIndex == 2
                      ? Colours.primaryColour
                      : Colors.grey,
                ),
                label: 'Badge',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.warning_rounded,
                  color: controller.currentIndex == 3
                      ? Colours.primaryColour
                      : Colors.grey,
                ),
                label: 'Urgence',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: controller.currentIndex == 4
                      ? Colours.primaryColour
                      : Colors.grey,
                ),
                label: 'Profil',
                backgroundColor: Colors.white,
              ),
            ],
          ),
        );
      },
    );
  }
}
