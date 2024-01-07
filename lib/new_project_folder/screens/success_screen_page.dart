import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone/new_project_folder/screens/home_screen.dart';

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 150.0,
            ),
            SizedBox(height: 20),
            Text(
              'Appointment booking Successful!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add your onPressed action here
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HomeScreen()));

              },
              child: Text('Go Home Screen '),
            ),
          ],
        ),
      ),
    );
  }
}