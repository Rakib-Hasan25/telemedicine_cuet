import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone/new_project_folder/screens/Appointment_card_screen.dart';
import 'package:flutter_amazon_clone/new_project_folder/screens/home_screen.dart';
import 'package:flutter_amazon_clone/new_project_folder/screens/success_screen_page.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  @override
  final List<Widget> _screens = [
    HomeScreen(),
    AppointmentCardScreen(),
  ];

  int currentSelectedIndex = 0;

  void changeScreen(int index) {
    currentSelectedIndex = index;
    setState(() {});
  }

  void backToHome() {
    changeScreen(0);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[currentSelectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentSelectedIndex,
        onTap: changeScreen,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        // showSelectedLabels: true,
        elevation: 4,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: 'Appointment'),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.shopping_cart), label: 'Cart'),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.favorite_border), label: 'Wishlist'),
        ],
      ),
    );
  }
}
