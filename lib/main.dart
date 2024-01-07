
import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone/constants/global_variables.dart';
import 'package:flutter_amazon_clone/features/auth/services/auth_service.dart';
import 'package:flutter_amazon_clone/new_project_folder/provider/category_search_provider.dart';
import 'package:flutter_amazon_clone/new_project_folder/provider/doctor_search_provider.dart';
import 'package:flutter_amazon_clone/new_project_folder/screens/home_screen.dart';

import 'package:flutter_amazon_clone/router.dart';
import 'package:provider/provider.dart';

void main() {
   runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => CategorySearchProvider()  
    ),
    ChangeNotifierProvider(
      create: (_) => DoctorSearchProvider()  
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
    // authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Telemedicine',
      theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          colorScheme: const ColorScheme.light(
            primary: GlobalVariables.secondaryColor,
          ),
          appBarTheme: const AppBarTheme(
              elevation: 0, iconTheme: IconThemeData(color: Colors.black))),
      onGenerateRoute: (settings) => generateRoute(settings),
      home:HomeScreen()
      
      //  Provider.of<UserProvider>(context).user.token.isNotEmpty
      // ?(Provider.of<UserProvider>(context).user.type =='user'?const BottomBar():const AdminBottomBar()): 
      // const AuthScreen(),
    );
  }
}
