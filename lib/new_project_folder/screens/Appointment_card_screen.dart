import 'package:flutter/material.dart';

import '../../constants/global_variables.dart';

class AppointmentCardScreen extends StatefulWidget {
  const AppointmentCardScreen({super.key});

  @override
  State<AppointmentCardScreen> createState() => _AppointmentCardScreenState();
}

class _AppointmentCardScreenState extends State<AppointmentCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
      
      PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            
            flexibleSpace: Container(
              decoration:
                  const BoxDecoration(gradient: GlobalVariables.appBarGradient),
            ),
            title: Text("All appointment")
           
          )
          ),



          body: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
           return InkWell(
             child: Card(
               child: ListTile(
                leading: Text("doctor image"),
                title: Row(
                  
                  children: [
                    Text("Doctor name"),
                    SizedBox(width: 80,),



                    // these icon will be available in specific time , give your logic 
                    InkWell(
                      onTap: (){

                      },
                      child: Icon(Icons.message)
                      ),
                    SizedBox(width: 13,),
                     InkWell(
                      onTap: (){

                      },
                      child: Icon(Icons.call)
                      ),
                       SizedBox(width: 13,),
                     InkWell(
                      onTap: (){

                      },
                      child: Icon(Icons.video_call)
                      ),
                  ],
                ),
                subtitle: Row(
                  children:[
                     Text("appointment time"),
                  ]
                  
                ),
               
               ),
             ),
           );
                  },
    )
    
    );
  }
}
