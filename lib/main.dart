import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone/constants/global_variables.dart';
import 'package:flutter_amazon_clone/features/auth/screens/admin_bottom_bar.dart';
import 'package:flutter_amazon_clone/features/auth/screens/auth_screens.dart';
import 'package:flutter_amazon_clone/features/auth/screens/bottom_bar.dart';
import 'package:flutter_amazon_clone/features/auth/services/auth_service.dart';

import 'package:flutter_amazon_clone/provider/user_provider.dart';
import 'package:flutter_amazon_clone/router.dart';
import 'package:provider/provider.dart';

void main() {
   runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();
  // This widget is the root of your application.
  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amazon Clone',
      theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          colorScheme: const ColorScheme.light(
            primary: GlobalVariables.secondaryColor,
          ),
          appBarTheme: const AppBarTheme(
              elevation: 0, iconTheme: IconThemeData(color: Colors.black))),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
      ?(Provider.of<UserProvider>(context).user.type =='user'?const BottomBar():const AdminBottomBar()): 
      const AuthScreen(),
    );
  }
}