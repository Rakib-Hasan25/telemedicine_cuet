import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone/new_project_folder/screens/Appointment_taking_screen.dart';

class DoctorDetailsScreen extends StatefulWidget {
  final String name;
  final String picture;
  final String degree;
  final String speciality;
  final String designation;
  final String workplace;

  const DoctorDetailsScreen(
      {super.key,
      required this.name,
      required this.picture,
      required this.degree,
      required this.speciality,
      required this.designation,
      required this.workplace});
  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  widget.picture,
                ), // Replace with actual image
              ),
            ),
            SizedBox(height: 20),
            Text(widget.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(widget.degree,
                style: TextStyle(fontSize: 18, color: Colors.grey)),
            SizedBox(height: 10),

            Align(
                alignment: Alignment.center,
                child: Text(widget.speciality, style: TextStyle(fontSize: 20))),
            SizedBox(height: 20),

            Text(widget.designation,
                style: TextStyle(fontSize: 18, color: Colors.grey)),
            //  SizedBox(height: 10),

            Align(
              alignment: Alignment.topCenter,
              child: Text(widget.workplace,
                  style: TextStyle(fontSize: 18, color: Colors.grey)),
            ),

            SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                // Add booking appointment logic
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AppointmentTakingScreen()));
              },
              child: Text('Book Appointment',
                  style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
