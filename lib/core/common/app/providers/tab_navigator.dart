import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class TabNavigator extends ChangeNotifier {
  final TabItem initialPage;
  final List<TabItem> navigationStack = [];

  TabNavigator(this.initialPage) {
    navigationStack.add(initialPage);
  }

  TabItem get currentPage => navigationStack.last;

  void push(TabItem page) {
    navigationStack.add(page);
    notifyListeners();
  }

  void pop() {
    if (navigationStack.length > 1) navigationStack.removeLast();
    notifyListeners();
  }

  void popToRoot() {
    navigationStack..clear()..add(initialPage);
    notifyListeners();
  }

  void popTo(TabItem page) {
    navigationStack.remove(page);
    notifyListeners();
  }

  void popUntil(TabItem? page) {
    if (page == null) return popToRoot();
    if (navigationStack.length > 1) {
      navigationStack.removeRange(1, navigationStack.indexOf(page) + 1);
      notifyListeners();
    }
  }

  void pushAndRemoveUntil(TabItem page) {
    navigationStack..clear()..add(page);
    notifyListeners();
  }
}

class TabNavigatorProvider extends InheritedNotifier<TabNavigator> {
  const TabNavigatorProvider({
    required this.navigator,
    required super.child,
    super.key,
  }) : super(notifier: navigator);

  final TabNavigator navigator;

  static TabNavigator? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<TabNavigatorProvider>()
        ?.navigator;
  }
}

class TabItem extends Equatable {
  final Widget child;
  final String id;

  TabItem({required this.child}) : id = const Uuid().v1();

  @override
  List<Object> get props => [id];
}
