import 'dart:async';
import 'dart:math';
import 'package:adonai/screens/phone/components/cellgroupdata.dart';
import 'package:adonai/screens/phone/components/circleCell.dart';
import 'package:adonai/screens/phone/constants.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:developer';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';

class CellGroup extends StatefulWidget {
  CellGroup({Key? key}) : super(key: key);

  var _contact =
      '080 2548 3335\nTue - Sun\n9:30 AM - 5:30 PM\ninfo@adonaichurch.in';
  var _addr = '14 Heerachand Road\nCox Town\nBangalore 560005';
  var _phoneno = '080 2548 3335';
  var _mail = 'info@adonaichurch.in';
  var dark;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(12.993889695337586, 77.62481619031142),
    zoom: 14.4746,
  );

  @override
  _CellGroupState createState() => _CellGroupState();
}

class _CellGroupState extends State<CellGroup> {
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController? newGoogleMapController;
  var _contact =
      '080 2548 3335\nTue - Sun\n9:30 AM - 5:30 PM\ninfo@adonaichurch.in';
  var _addr = '14 Heerachand Road\nCox Town\nBangalore 560005';
  var _phoneno = '080 2548 3335';
  var _mail = 'info@adonaichurch.in';
  String dark = "";
  Set<Marker> _markers = {};
  final List<String> imageList = [
    "assets/img1.jpg",
    "assets/img1.jpg",
    "assets/img1.jpg",
    "assets/img1.jpg",
    "assets/img1.jpg",
    "assets/img1.jpg",
  ];

  List<CellGroupData> cell = [
    new CellGroupData(
      "assets/img1.jpg",
      "Koramanagala",
    ),
    new CellGroupData(
      "assets/img1.jpg",
      "Sarjapur",
    ),
    new CellGroupData(
      "assets/img1.jpg",
      "Whitefield",
    ),
    new CellGroupData(
      "assets/img1.jpg",
      "Jaynagar",
    ),
    new CellGroupData(
      "assets/img1.jpg",
      "Cox Town",
    ),
    new CellGroupData(
      "assets/img1.jpg",
      "Koramanagala",
    ),
    new CellGroupData(
      "assets/img1.jpg",
      "Koramanagala",
    ),
    new CellGroupData(
      "assets/img1.jpg",
      "Koramanagala",
    ),
    new CellGroupData(
      "assets/img1.jpg",
      "Koramanagala",
    ),
  ];
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(12.993889695337586, 77.62481619031142),
    zoom: 14.4746,
  );

//   Future<String> changeMapMode(){
//   dark=getJsonFile("assets/dark.json");
//   return dark;
// }

  Future<String> changeMapMode() async {
    // final _darkmode=rootBundle.loadString("assets/dark.txt");
    // setState((){
    //   dark=_darkmode as String;
    // });

    String text = '';
    try {
      // final Directory directory = await getApplicationDocumentsDirectory();
      // final File file = File("assets/dark.txt");
      // text = await file.readAsString();
      text = await rootBundle.loadString('assets/dark.json');
    } catch (e) {
      print('Couldnt read file $e');
    }
    dark = text;
    return text;
  }

  @override
  void initState() {
    super.initState();
    print("heelloooo");
    changeMapMode();
  }

  Future<String> getJsonFile(String path) async {
    return await rootBundle.loadString(path);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // double _height=MediaQuery.of(context).size.height;
    // double _width=MediaQuery.of(context).size.width;

    double bh = SizeConfig.blockSizeVertical;
    double bw = SizeConfig.blockSizeHorizontal;

    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(children: [
          Padding(
            padding: EdgeInsets.fromLTRB(bw * 10, bw * 7, bw * 10, bw * 7),
            child: Container(
              child: Column(
                children: [
                  Text(
                    "CELL GROUP",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(color: Colors.grey[700], fontSize: bw * 6.5),
                  ),
                ],
              ),
            ),
          ),

          GFCarousel(
            //autoPlay:true;
            autoPlay: true,
            pagination: true,
            viewportFraction: 1.0,
            aspectRatio: 2,

            items: imageList.map(
              (url) {
                return Container(
                  //margin: EdgeInsets.all(8.0),
                  child: ClipRRect(
                    //borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Image.asset(
                      url,
                      fit: BoxFit.cover,
                      width: bw * 100,
                      height: bh * 100,
                    ),
                  ),
                );
              },
            ).toList(),
            // onPageChanged: (index) {
            //   setState(() {
            //     index;
            //   });
            // },
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 25, 30, 7),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a fringilla odio. Phasellus sed maximus urna. Curabitur bibendum sollicitudin nisi, sit amet rhoncus massa elementum a. Aliquam erat volutpat. Nullam vitae felis eget ',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[500], fontSize: 15),
            ),
          ),

          SizedBox(height: bh * 4),
          Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(bw * 7, bw * 5, bw * 7, bw),
                  child: Container(
                    height: bh * 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                      ),
                      // decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: GoogleMap(
                        initialCameraPosition: _kGooglePlex,
                        mapType: MapType.normal,
                        onMapCreated: (GoogleMapController controller) {
                          if (!_controller.isCompleted) {
                            //first calling is false
                            //call "completer()"
                            _controller.complete(controller);
                          }
                          newGoogleMapController = controller;
                          //dark=await changeMapMode();
                          if (dark != '') {
                            newGoogleMapController!.setMapStyle(dark);
                          }
                        },
                        markers: {adonai_loc},
                      ),
                    ),
                  ),
                ),
              ]),
          //   CarouselSlider(
          //   options: CarouselOptions(
          //     height: 200.0,
          //     autoPlay: true,
          //     autoPlayInterval: Duration(seconds: 3),
          //     autoPlayAnimationDuration: Duration(milliseconds: 800),
          //     autoPlayCurve: Curves.fastOutSlowIn,
          //     pauseAutoPlayOnTouch: true,
          //     aspectRatio: 2.0,
          //     onPageChanged: (index, reason) {
          //       setState(() {
          //         _currentIndex = index;
          //       });
          //     },
          //   ),
          //   items: imageList.map((card){
          //     return Builder(
          //       builder:(BuildContext context){
          //         return Container(
          //           height: MediaQuery.of(context).size.height*0.30,
          //           width: MediaQuery.of(context).size.width,
          //           child: Card(
          //             color: Colors.blueAccent,
          //             child: card,
          //           ),
          //         );
          //       }
          //     );
          //   }).toList(),
          // ),
          SizedBox(height: bh * 4),
          Padding(
            padding: EdgeInsets.fromLTRB(bw * 7, 0, 0, bw ),
            child: Container(
                width: double.infinity,
                height: 150.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (var c in cell) circleCell(c, context),
                  ],
                )),
          ),
          Container(
            child: Card(
              child: Container(
                height: 100,
                color: Colors.white,
                child: Row(
                  children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(bw),
                        child: Expanded(
                          child: Image.asset(imageList[0]),
                          flex: 2,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 5,
                              child: ListTile(
                                
                                subtitle: Text(" 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a fringilla odio. Phasellus sed maximus urna. Curabitur bibendum sollicitudin nisi, sit amet rhoncus massa elementum a. Aliquam erat volutpat. Nullam vitae felis eget ',"),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  
                                  // TextButton(
                                  //   child: Text("PLAY"),
                                  //   onPressed: () {},
                                  // ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  // TextButton(
                                  //   child: Text("ADD TO QUEUE"),
                                  //   onPressed: () {},
                                  // ),
                                  SizedBox(
                                    width: 8,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      flex: 8,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]));
  }

  Marker adonai_loc = Marker(
    markerId: MarkerId('adonai'),
    position: LatLng(12.993889695337586, 77.62481619031142),
    infoWindow: InfoWindow(title: 'Adonai Church'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueRed,
    ),
  );
}

void navigateTo(double lat, double lng) async {
  var uri = Uri.parse("google.navigation:q=$lat,$lng&mode=d");
  if (await canLaunch(uri.toString())) {
    await launch(uri.toString());
  } else {
    throw 'Could not launch ${uri.toString()}';
  }
}

_launchPhoneURL(String phoneNumber) async {
  String url = 'tel:' + phoneNumber;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void _launchMailURL(String mail) async {
  final Uri params = Uri(
    scheme: 'mailto',
    path: mail,
  );
  String url = params.toString();
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print('Could not launch $url');
  }
}

// class CellGroup extends StatefulWidget {
//   const CellGroup({ Key? key }) : super(key: key);

//   @override
//   _CellGroupState createState() => _CellGroupState();
// }
//   Completer<GoogleMapController> _controller = Completer();

//   const LatLng _center = const LatLng(45.521563, -122.677433);

//   void _onMapCreated(GoogleMapController controller) {
//     _controller.complete(controller);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Maps Sample App'),
//           backgroundColor: Colors.green[700],
//         ),
//         body: GoogleMap(
//           onMapCreated: _onMapCreated,
//           initialCameraPosition: CameraPosition(
//             target: _center,
//             zoom: 11.0,
//           ),
//         ),
//       ),
//     );
//   }
// class _CellGroupState extends State<CellGroup> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Maps Sample App'),
//           backgroundColor: Colors.green[700],
//         ),
//         body: GoogleMap(
//           onMapCreated: _onMapCreated,
//           initialCameraPosition: CameraPosition(
//             target: _center,
//             zoom: 11.0,
//           ),
//         ),
//       ),
//     );
//   }
// }
// ignore: must_be_immutable

// class CellGroup extends StatelessWidget {
//    CellGroup({ Key? key }) : super(key: key);
//   Completer<GoogleMapController> _controller = Completer();
//   GoogleMapController? newGoogleMapController;
//   Set<Marker> _markers = {};
//   var dark;

//   var _contact =
//       '080 2548 3335\nTue - Sun\n9:30 AM - 5:30 PM\ninfo@adonaichurch.in';
//   var _addr = '14 Heerachand Road\nCox Town\nBangalore 560005';
//   var _phoneno = '080 2548 3335';
//   var _mail = 'info@adonaichurch.in';

//   static final CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(12.993889695337586, 77.62481619031142),
//     zoom: 14.4746,
//   );

// changeMapMode(){
//   dark=getJsonFile("assets/dark.json");
// }
//  Future<String> getJsonFile(String path)async{
//    return await rootBundle.loadString(path);
//  }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         // backgroundColor: adonaiSlateGray,
//         title: Center(
//             child: Text(
//           'ADONAI',
//           style: TextStyle(color: Colors.black, letterSpacing: 3, fontSize: 20),
//         )),
//       ),
//       body: SafeArea(
//           child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//             Container(
//               height: MediaQuery.of(context).size.height / 2.9,
//               child: GoogleMap(
//                 initialCameraPosition: _kGooglePlex,
//                 mapType: MapType.normal,
//                 onMapCreated: (GoogleMapController controller) {
//                   _controller.complete(controller);
//                   newGoogleMapController=controller;
//                   newGoogleMapController!.setMapStyle('''
//                     [
//                       {
//                         "elementType": "geometry",
//                         "stylers": [
//                           {
//                             "color": "#242f3e"
//                           }
//                         ]
//                       },
//                       {
//                         "elementType": "labels.text.fill",
//                         "stylers": [
//                           {
//                             "color": "#746855"
//                           }
//                         ]
//                       },
//                       {
//                         "elementType": "labels.text.stroke",
//                         "stylers": [
//                           {
//                             "color": "#242f3e"
//                           }
//                         ]
//                       },
//                       {
//                         "featureType": "administrative.locality",
//                         "elementType": "labels.text.fill",
//                         "stylers": [
//                           {
//                             "color": "#d59563"
//                           }
//                         ]
//                       },
//                       {
//                         "featureType": "poi",
//                         "elementType": "labels.text.fill",
//                         "stylers": [
//                           {
//                             "color": "#d59563"
//                           }
//                         ]
//                       },
//                       {
//                         "featureType": "poi.park",
//                         "elementType": "geometry",
//                         "stylers": [
//                           {
//                             "color": "#263c3f"
//                           }
//                         ]
//                       },
//                       {
//                         "featureType": "poi.park",
//                         "elementType": "labels.text.fill",
//                         "stylers": [
//                           {
//                             "color": "#6b9a76"
//                           }
//                         ]
//                       },
//                       {
//                         "featureType": "road",
//                         "elementType": "geometry",
//                         "stylers": [
//                           {
//                             "color": "#38414e"
//                           }
//                         ]
//                       },
//                       {
//                         "featureType": "road",
//                         "elementType": "geometry.stroke",
//                         "stylers": [
//                           {
//                             "color": "#212a37"
//                           }
//                         ]
//                       },
//                       {
//                         "featureType": "road",
//                         "elementType": "labels.text.fill",
//                         "stylers": [
//                           {
//                             "color": "#9ca5b3"
//                           }
//                         ]
//                       },
//                       {
//                         "featureType": "road.highway",
//                         "elementType": "geometry",
//                         "stylers": [
//                           {
//                             "color": "#746855"
//                           }
//                         ]
//                       },
//                       {
//                         "featureType": "road.highway",
//                         "elementType": "geometry.stroke",
//                         "stylers": [
//                           {
//                             "color": "#1f2835"
//                           }
//                         ]
//                       },
//                       {
//                         "featureType": "road.highway",
//                         "elementType": "labels.text.fill",
//                         "stylers": [
//                           {
//                             "color": "#f3d19c"
//                           }
//                         ]
//                       },
//                       {
//                         "featureType": "transit",
//                         "elementType": "geometry",
//                         "stylers": [
//                           {
//                             "color": "#2f3948"
//                           }
//                         ]
//                       },
//                       {
//                         "featureType": "transit.station",
//                         "elementType": "labels.text.fill",
//                         "stylers": [
//                           {
//                             "color": "#d59563"
//                           }
//                         ]
//                       },
//                       {
//                         "featureType": "water",
//                         "elementType": "geometry",
//                         "stylers": [
//                           {
//                             "color": "#17263c"
//                           }
//                         ]
//                       },
//                       {
//                         "featureType": "water",
//                         "elementType": "labels.text.fill",
//                         "stylers": [
//                           {
//                             "color": "#515c6d"
//                           }
//                         ]
//                       },
//                       {
//                         "featureType": "water",
//                         "elementType": "labels.text.stroke",
//                         "stylers": [
//                           {
//                             "color": "#17263c"
//                           }
//                         ]
//                       }
//                     ]
//                 ''');
                  
//                 },
//                 markers: {adonai_loc},
//               ),
//             ),
//             SizedBox(height: 50),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
//               child: Container(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(0,0,60,0),
//                       child: Container(
//                         padding: EdgeInsets.only(
//                           bottom: 3, // space between underline and text
//                         ),
//                         decoration: BoxDecoration(
//                             border: Border(
//                                 bottom: BorderSide(
//                           color: Colors.grey[500]!, // Text colour here
//                           width: 1.0, // Underline width
//                         ))),
//                         child: Text(
//                           'GET IN TOUCH WITH US',
//                           textAlign: TextAlign.left,
//                           style: TextStyle(
//                             fontSize: 20,
//                             color: Colors.black54,
//                             letterSpacing: 3,
//                           ),
//                         ),
//                       ),
//                     ),

               
//                     SizedBox(height: 10),
//                     SelectableText(
//                       _contact,
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                         height: 1.2,
//                         fontSize: 16,
//                         color: Colors.black54,
                       
//                       ),
//                     ),
//                     SizedBox(height: 40),
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(0,0,210,0),
//                       child: Container(
//                         padding: EdgeInsets.only(
//                           bottom: 3,
//                           right: 50 // space between underline and text
//                         ),
//                         decoration: BoxDecoration(
//                             border: Border(
//                                 bottom: BorderSide(
//                           color: Colors.grey[500]!, // Text colour here
//                           width: 1.0, // Underline width
//                         ))),
//                         child: Text(
//                           'ADDRESS',
//                           textAlign: TextAlign.left,
//                           style: TextStyle(
//                             fontSize: 20,
//                             color: Colors.black54,
//                             letterSpacing: 3,
//                           ),
//                         ),
//                       ),
//                     ),

//                     SizedBox(height: 10),
//                     SelectableText(
//                       _addr,
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                         height: 1.2,
//                         fontSize: 16,
//                         color: Colors.black54,
//                         fontWeight: FontWeight.normal,
//                         // letterSpacing: 3,

//                         // wordSpacing: 3,
//                       ),
//                     ),
             
//                   ],
//                 ),
//               ),
//             )
//           ])),
//       floatingActionButton: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           Align(
//             alignment: Alignment.bottomRight,
//             child: FloatingActionButton.extended(
//               onPressed: () {
//                 _launchPhoneURL(_phoneno);
//               },
//               label: Text('Call'),
//               icon: Icon(Icons.phone),
//               backgroundColor: Colors.grey[500]!,
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Align(
//             alignment: Alignment.bottomRight,
//             child: FloatingActionButton.extended(
//                 // shape: new RoundedRectangleBorder(
//                 //   borderRadius: new BorderRadius.circular(40.0),
//                 // ) ,
//                 onPressed: () {
//                   _launchMailURL(_mail);
//                 },
//                 label: Text('Email'),
//                 icon: Icon(Icons.mail),
//                 backgroundColor: Colors.grey[500]!),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Align(
//             alignment: Alignment.bottomRight,
//             child: FloatingActionButton.extended(
//               onPressed: () {
//                 navigateTo(12.993889695337586, 77.62481619031142);
//               },
//               label: Text('Open in Maps'),
//               icon: Icon(Icons.map),
//               backgroundColor: Colors.grey[500]!,
//             ),
//           ),
//         ],
//       ),
//     );
    
//   }
//   Marker adonai_loc = Marker(
//     markerId: MarkerId('adonai'),
//     position: LatLng(12.993889695337586, 77.62481619031142),
//     infoWindow: InfoWindow(title: 'Adonai Church'),
//     icon: BitmapDescriptor.defaultMarkerWithHue(
//       BitmapDescriptor.hueRed,
//     ),
//   );
// }





// class Contact extends StatefulWidget {
//   @override
//   _ContactState createState() => _ContactState();
// }

// class _ContactState extends State<Contact> {
//   Completer<GoogleMapController> _controller = Completer();
//   Set<Marker> _markers = {};

//   var _contact =
//       '080 2548 3335\nTue - Sun\n9:30 AM - 5:30 PM\ninfo@adonaichurch.in';
//   var _addr = '14 Heerachand Road\nCox Town\nBangalore 560005';
//   var _phoneno = '080 2548 3335';
//   var _mail = 'info@adonaichurch.in';

//   static final CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(12.993889695337586, 77.62481619031142),
//     zoom: 14.4746,
//   );

  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         // backgroundColor: adonaiSlateGray,
//         title: Center(
//             child: Text(
//           'ADONAI',
//           style: TextStyle(color: Colors.black, letterSpacing: 3, fontSize: 20),
//         )),
//       ),
//       body: SafeArea(
//           child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//             Container(
//               height: MediaQuery.of(context).size.height / 2.9,
//               child: GoogleMap(
//                 initialCameraPosition: _kGooglePlex,
//                 mapType: MapType.normal,
//                 onMapCreated: (GoogleMapController controller) {
//                   _controller.complete(controller);
//                 },
//                 markers: {adonai_loc},
//               ),
//             ),
//             SizedBox(height: 50),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
//               child: Container(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(0,0,60,0),
//                       child: Container(
//                         padding: EdgeInsets.only(
//                           bottom: 3, // space between underline and text
//                         ),
//                         decoration: BoxDecoration(
//                             border: Border(
//                                 bottom: BorderSide(
//                           color: Colors.grey[500]!, // Text colour here
//                           width: 1.0, // Underline width
//                         ))),
//                         child: Text(
//                           'GET IN TOUCH WITH US',
//                           textAlign: TextAlign.left,
//                           style: TextStyle(
//                             fontSize: 20,
//                             color: Colors.black54,
//                             letterSpacing: 3,
//                           ),
//                         ),
//                       ),
//                     ),

               
//                     SizedBox(height: 10),
//                     SelectableText(
//                       _contact,
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                         height: 1.2,
//                         fontSize: 16,
//                         color: Colors.black54,
                       
//                       ),
//                     ),
//                     SizedBox(height: 40),
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(0,0,210,0),
//                       child: Container(
//                         padding: EdgeInsets.only(
//                           bottom: 3,
//                           right: 50 // space between underline and text
//                         ),
//                         decoration: BoxDecoration(
//                             border: Border(
//                                 bottom: BorderSide(
//                           color: Colors.grey[500]!, // Text colour here
//                           width: 1.0, // Underline width
//                         ))),
//                         child: Text(
//                           'ADDRESS',
//                           textAlign: TextAlign.left,
//                           style: TextStyle(
//                             fontSize: 20,
//                             color: Colors.black54,
//                             letterSpacing: 3,
//                           ),
//                         ),
//                       ),
//                     ),

//                     SizedBox(height: 10),
//                     SelectableText(
//                       _addr,
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                         height: 1.2,
//                         fontSize: 16,
//                         color: Colors.black54,
//                         fontWeight: FontWeight.normal,
//                         // letterSpacing: 3,

//                         // wordSpacing: 3,
//                       ),
//                     ),
             
//                   ],
//                 ),
//               ),
//             )
//           ])),
//       floatingActionButton: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           Align(
//             alignment: Alignment.bottomRight,
//             child: FloatingActionButton.extended(
//               onPressed: () {
//                 _launchPhoneURL(_phoneno);
//               },
//               label: Text('Call'),
//               icon: Icon(Icons.phone),
//               backgroundColor: Colors.grey[500]!,
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Align(
//             alignment: Alignment.bottomRight,
//             child: FloatingActionButton.extended(
//                 // shape: new RoundedRectangleBorder(
//                 //   borderRadius: new BorderRadius.circular(40.0),
//                 // ) ,
//                 onPressed: () {
//                   _launchMailURL(_mail);
//                 },
//                 label: Text('Email'),
//                 icon: Icon(Icons.mail),
//                 backgroundColor: Colors.grey[500]!),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Align(
//             alignment: Alignment.bottomRight,
//             child: FloatingActionButton.extended(
//               onPressed: () {
//                 navigateTo(12.993889695337586, 77.62481619031142);
//               },
//               label: Text('Open in Maps'),
//               icon: Icon(Icons.map),
//               backgroundColor: Colors.grey[500]!,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Marker adonai_loc = Marker(
//     markerId: MarkerId('adonai'),
//     position: LatLng(12.993889695337586, 77.62481619031142),
//     infoWindow: InfoWindow(title: 'Adonai Church'),
//     icon: BitmapDescriptor.defaultMarkerWithHue(
//       BitmapDescriptor.hueRed,
//     ),
//   );
// }


// void navigateTo(double lat, double lng) async {
//   var uri = Uri.parse("google.navigation:q=$lat,$lng&mode=d");
//   if (await canLaunch(uri.toString())) {
//     await launch(uri.toString());
//   } else {
//     throw 'Could not launch ${uri.toString()}';
//   }
// }

// _launchPhoneURL(String phoneNumber) async {
//   String url = 'tel:' + phoneNumber;
//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }

// void _launchMailURL(String mail) async {
//   final Uri params = Uri(
//     scheme: 'mailto',
//     path: mail,
//   );
//   String url = params.toString();
//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     print('Could not launch $url');
//   }
// }
