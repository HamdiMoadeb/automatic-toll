import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tollxpress/core/common/app/providers/tab_navigator.dart';
import 'package:tollxpress/core/common/views/presistent_view.dart';
import 'package:tollxpress/feature/home/presentation/pages/views/car_view.dart';
import 'package:tollxpress/feature/home/presentation/pages/views/complaint_view.dart';
import 'package:tollxpress/feature/home/presentation/pages/views/tag_view.dart';
import 'package:tollxpress/feature/home/presentation/pages/views/trip_view.dart';
import 'package:tollxpress/feature/home/presentation/pages/views/wallet_view.dart';
import 'package:tollxpress/feature/profile/presentation/pages/profile_screen.dart';

class DashboardController extends ChangeNotifier {
  List<int> _indexHistory = [0];

  final List<Widget> _screens = [
    ChangeNotifierProvider(
      create: (_) => TabNavigator(TabItem(child: const TripView())),
      child: const PersistentView(),
    ),
    ChangeNotifierProvider(
      create: (_) => TabNavigator(TabItem(child: const CarView())),
      child: const PersistentView(),
    ),
    ChangeNotifierProvider(
      create: (_) => TabNavigator(TabItem(child: const TagView())),
      child: const PersistentView(),
    ),
    ChangeNotifierProvider(
      create: (_) => TabNavigator(TabItem(child: const ComplaintView())),
      child: const PersistentView(),
    ),
    ChangeNotifierProvider(
      create: (_) => TabNavigator(TabItem(child: const ProfileScreen())),
      child: const PersistentView(),
    ),
  ];

  List<Widget> get screens => _screens;
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void changeIndex(int index) {
    if (_currentIndex == index) return;
    _currentIndex = index;
    _indexHistory.add(index);
    notifyListeners();
  }

  void goBack() {
    if (_indexHistory.length == 1) return;
    _indexHistory.removeLast();
    _currentIndex = _indexHistory.last;
    notifyListeners();
  }

  void resetIndex() {
    _indexHistory = [0];
    _currentIndex = 0;
    notifyListeners();
  }
}
