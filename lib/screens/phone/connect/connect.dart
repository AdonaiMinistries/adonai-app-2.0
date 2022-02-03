import 'package:adonai/screens/phone/connect/daughtersofzion.dart';
import 'package:adonai/screens/phone/data.dart';
import 'package:adonai/screens/phone/models/ConnectPageCard.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


import 'connectCard.dart';

class ConnectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 0, 20, 20),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "CHURCH",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[500], fontSize: 30),
              ),
            ),

            //tempCard(),

            Flexible(
              child: ListView(
                // scrollDirection: Axis.vertical,
                // shrinkWrap: true,
                children: pages.map((page) {
                  return ConnectCard(name: page.name);
                }).toList(),
              ),
            ),

            //buildImageI
            //nteractionCard(context,data: data),
            //buildImageInteractionCard(context,data: data),
            //buildImageInteractionCard(context,data: data),

            // Card(
            //   clipBehavior: Clip.antiAlias,
            //   child: Column(
            //     children: [
            //       ListTile(
            //         leading: Icon(Icons.arrow_drop_down_circle),
            //         title: const Text('Card title 1'),
            //         subtitle: Text(
            //           'Secondary Text',
            //           style: TextStyle(color: Colors.black.withOpacity(0.6)),
            //         ),
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.all(16.0),
            //         child: Text(
            //           'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
            //           style: TextStyle(color: Colors.black.withOpacity(0.6)),
            //         ),
            //       ),
            //       ButtonBar(
            //         alignment: MainAxisAlignment.start,
            //         children: [
            //           FlatButton(
            //             onPressed: () {
            //               // Perform some action
            //             },
            //             child: const Text('ACTION 1'),
            //           ),
            //           FlatButton(
            //             onPressed: () {
            //               // Perform some action
            //             },
            //             child: const Text('ACTION 2'),
            //           ),
            //         ],
            //       ),
            //       //Image.asset('assets/card-sample-image.jpg'),
            //     ],
            //   ),
            // ),
            // Card(
            //   clipBehavior: Clip.antiAlias,
            //   child: Column(
            //     children: [
            //       ListTile(
            //         leading: Icon(Icons.arrow_drop_down_circle),
            //         title: const Text('Card title 1'),
            //         subtitle: Text(
            //           'Secondary Text',
            //           style: TextStyle(color: Colors.black.withOpacity(0.6)),
            //         ),
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.all(16.0),
            //         child: Text(
            //           'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
            //           style: TextStyle(color: Colors.black.withOpacity(0.6)),
            //         ),
            //       ),
            //       ButtonBar(
            //         alignment: MainAxisAlignment.start,
            //         children: [
            //           TextButton(
            //             onPressed: () {
            //               // Perform some action
            //             },
            //             child: const Text('ACTION 1'),
            //           ),
            //           TextButton(
            //             onPressed: () {
            //               // Perform some action
            //             },
            //             child: const Text('ACTION 2'),
            //           ),
            //         ],
            //       ),
            //       //Image.asset('assets/card-sample-image-2.jpg'),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget tempCard() => Card(
        shadowColor: Colors.grey,
        elevation: 6,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rounded card',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'This card is rounded',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      );

  Widget buildImageInteractionCard(BuildContext context) => InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DaughtersOfZion()));
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
                padding: EdgeInsets.fromLTRB(25, 10, 25, 5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'CELL GROUP',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(25, 5, 25, 25),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.Proin a fringilla odio. Phasellus sed maximus urna. Curabitur bibe',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
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
