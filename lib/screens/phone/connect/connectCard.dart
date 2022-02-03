import 'package:adonai/screens/phone/connect/adonaibuildingproject.dart';
import 'package:adonai/screens/phone/connect/cellgroups.dart';
import 'package:adonai/screens/phone/connect/connect.dart';
import 'package:adonai/screens/phone/connect/daughtersofzion.dart';
import 'package:adonai/screens/phone/connect/prayerNight.dart';
import 'package:adonai/screens/phone/connect/tinystars.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ConnectCard extends StatelessWidget {
  final String name;

  const ConnectCard({ Key? key, required this.name }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    Widget child=ConnectPage() ;
    if(name == "DaughtersOfZion")
      child = DaughtersOfZion();
    else if(name == "TinyStars")
      child = TinyStars();
      
    else if(name=="AdonaiBuildingProject")
    child=AdonaiBuildingProject();
    else if(name=="PrayerNight")
    child= PrayerNight();
    else if(name=="CellGroup")
    child= CellGroup();
    
    
    return InkWell(
      
    onTap:(){
  Navigator.push(
    context,

    MaterialPageRoute(builder: (context) => child));

},

    
    child: Card(
          shadowColor: Colors.grey,
          elevation: 6,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 25, 25, 7),
                    child: ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: Image(
      image: AssetImage('assets/img1.jpg'),
    ),
                    ),
                  ),
                  // Ink.image(
                  //   image: AssetImage('assets/img1.jpg'),
                  //   height: 240,
                  //   fit: BoxFit.cover,
                  // ),
                  // Positioned(
                  //   bottom: 16,
                  //   right: 16,
                  //   left: 16,
                  //   child: Text(
                  //     'Cats rule the world!',
                  //     style: TextStyle(
                  //       fontWeight: FontWeight.bold,
                  //       color: Colors.white,
                  //       fontSize: 24,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(25,10, 25,5),
                child: 
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '$name',
                    style: TextStyle(fontSize: 16,
                    color: Colors.grey),
                    textAlign:TextAlign.left,
                  ),
                ),
              ),
  
              Padding(
                padding: EdgeInsets.fromLTRB(25,5, 25,25),
                child: 
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.Proin a fringilla odio. Phasellus sed maximus urna. Curabitur bibe',
                  style: TextStyle(fontSize: 12,
                  color: Colors.grey),
                ),
              ),
              // ButtonBar(
              //   alignment: MainAxisAlignment.start,
              //   children: [
              //     FlatButton(
              //       child: Text('Buy Cat'),
              //       onPressed: () {},
              //     ),
              //     FlatButton(
              //       child: Text('Buy Cat Food'),
              //       onPressed: () {},
              //     )
              //   ],
              // )
              
            ],
            
          ),
        ),
  );
  }
}