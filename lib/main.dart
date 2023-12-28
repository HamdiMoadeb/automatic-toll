import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tollxpress/core/common/app/providers/user_provider.dart';
import 'package:tollxpress/core/services/router.dart';
import 'package:tollxpress/feature/home/presentation/manager/providers/dashboard_controller.dart';

import 'core/res/colours.dart';
import 'core/res/fonts.dart';
import 'core/services/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => DashboardController()),
      ],
      child: MaterialApp(
        title: 'TollXpress',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSwatch(accentColor: Colours.primaryColour),
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: Fonts.poppins,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            color: Colors.transparent,
          ),
        ),
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
