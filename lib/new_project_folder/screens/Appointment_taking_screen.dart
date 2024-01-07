
import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone/new_project_folder/screens/success_screen_page.dart';
import 'package:table_calendar/table_calendar.dart';

//visit pub.dev  for optimization

class AppointmentTakingScreen extends StatefulWidget {
  const AppointmentTakingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AppointmentTakingScreenState createState() =>
      _AppointmentTakingScreenState();
}

class _AppointmentTakingScreenState extends State<AppointmentTakingScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  TimeOfDay selectedTime = TimeOfDay.now();
  bool timeSelectionSucess = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Appointment"),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              // Use `selectedDayPredicate` to determine which day is currently selected.
              // If this returns true, then `day` will be marked as selected.

              // Using `isSameDay` is recommended to disregard
              // the time-part of compared DateTime objects.
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                // Call `setState()` when updating the selected day
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              }
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                // Call `setState()` when updating calendar format
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              // No need to call `setState()` here
              _focusedDay = focusedDay;
            },
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blueAccent,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: TextStyle(fontSize: 20),
              ),
              onPressed: () async {
                final TimeOfDay? timeOfDay = await showTimePicker(
                    context: context,
                    initialTime: selectedTime,
                    initialEntryMode: TimePickerEntryMode.dial);
                if (timeOfDay != null) {
                  setState(() {
                    selectedTime = timeOfDay;
                    timeSelectionSucess = true;
                  });
                }
              },
              child:timeSelectionSucess?Text("${selectedTime}") : Text(
                "Choose time",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              )),


              SizedBox(height: 100,),

              SizedBox(
                width:MediaQuery.of(context).size.width*0.75,
                child: ElevatedButton(onPressed: (){

                    // store doctor and appointment details and fetch this data in appointment card Screen





                   Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SuccessScreen()));
                }, child: Text("Make Appointment")))
        ],
      ),
    );
  }
}
