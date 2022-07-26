import 'package:adonai/screens/phone/components/cardcarosel.dart';
import 'package:adonai/screens/phone/navigationbar.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';



class TinyStars extends StatelessWidget {
  final List<String> _items = [
    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
  ];
  // final List<String> imageList = [
  //   "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
  //   "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
  //   "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
  //   "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
  //   "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
  //   "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
  // ];
    final List<String> imageList = [
    "assets/img1.jpg",
    "assets/img1.jpg",
        "assets/img1.jpg",
        "assets/img1.jpg",
        "assets/img1.jpg",
        "assets/img1.jpg",
  ];
  List<String> images = [
    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
  ];

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 25, 25, 7),
            child: Container(
              child: Column(
                children: [
                  Text(
                    "KINGDOM KIDS",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[500], fontSize: 10),
                  ),
                  Text(
                    "TINY STARS (3-5)",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[500], fontSize: 30),
                  ),
                ],
              ),
            ),
          ),
          //  Image.network(
          //               'https://media.geeksforgeeks.org/wp-content/cdn-uploads/20190806131525/forkPython.jpg'), //Image.network
          SizedBox(height: 10),
          GFCarousel(
            //autoPlay:true;
            autoPlay: true,
            hasPagination: true,
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
                      width: 1000.0,
                      height: 1000,
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

          //Padding

          // Padding(
          //   padding: const EdgeInsets.fromLTRB(30,25,30,7),
          //   child: Container(
          //     padding: EdgeInsets.all(12.0),
          //     child: GridView.builder(
          //       scrollDirection: Axis.vertical,
          //       shrinkWrap: true,
          //       itemCount: images.length,
          //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //           crossAxisCount: 3,
          //           crossAxisSpacing: 10,
          //           mainAxisSpacing: 10 ,
          //       ),
          //       itemBuilder: (BuildContext context, int index){
          //         return Container(
          //                       decoration: new BoxDecoration(
          //                         borderRadius: BorderRadius.all(Radius.circular(20.0)),
          //                           image: new DecorationImage(
          //                               image: new NetworkImage(
          //                                   images[index]),
          //                               fit: BoxFit.cover)
          //                               )
          //                               );
          //         //return Image.network(images[index]);
          //       },
          //     ),
          //   ),
          // ),

//           Padding(
//             padding: const EdgeInsets.all(80),
//             child: ElevatedButton(
//                 onPressed: () {
//                   // Respond to button press
//                 },
//                 child: Text("+91 89876 88777"),
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all(Colors.grey[400]),
//   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//     RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(20),
//     )
//   )
// ),

//               ),

//           ),
          Center(
            child: Container(
              padding: EdgeInsets.fromLTRB(90, 20, 90, 5),
              child: ElevatedButton.icon(
                icon: Icon(
                  Icons.phone,
                  color: Colors.white,
                  size: 28.0,
                ),
                label: Text('+91 89876 88777'),
                onPressed: () {
                  print('Pressed');
                },
                style: ElevatedButton.styleFrom(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  primary: Colors.grey[400],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(35, 25, 35, 7),
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(35, 5, 35, 25),
                    child: Text(
                      "Curriculum",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[500], fontSize: 22),
                    ),
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a fringilla odio. Phasellus sed maximus urna. Curabitur bibendum sollicitudin nisi, sit amet rhoncus massa elementum a. Aliquam erat volutpat. Nullam vitae felis eget ',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[500], fontSize: 11),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(35, 25, 35, 6),
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
              height: 210.0,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  // border: Border.all(color:
                  // Colors.red),
                  borderRadius: BorderRadius.circular(20)),

              // padding: const EdgeInsets.fromLTRB(50, 120, 10, 10),
              // color: Colors.blue,
              // width: 200.0,
              // height: 200.0,
              // child: Text(
              //   'GeeksforGeeks',
              //   style: TextStyle(color: Colors.white),
              // ), //Text

              child: Column(
                children: [
                  Text(
                    'Teachers',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[500], fontSize: 22),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                    child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: images.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            decoration: new BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                image: new DecorationImage(
                                    image: new AssetImage(imageList[index]),
                                    fit: BoxFit.cover)));
                        //return Image.network(images[index]);
                      },
                    ),
                  ),
                ],
              ),
              
            ), //Container
          ),
           Padding(
            padding: const EdgeInsets.fromLTRB(35, 25, 35, 7),
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(35, 5, 35, 25),
                    child: Text(
                      "Schedule",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[500], fontSize: 22),
                    ),
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a fringilla odio. Phasellus sed maximus urna. Curabitur bibendum sollicitudin nisi, sit amet rhoncus massa elementum a. Aliquam erat volutpat. Nullam vitae felis eget ',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[500], fontSize: 11),
                  ),
                ],
              ),
            ),
          ),


          Padding(
            padding: const EdgeInsets.fromLTRB(35, 25, 35, 7),
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(35, 5, 35, 7),
                    child: Text(
                      "Testimonials",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[500], fontSize: 22),
                    ),
                  ),
                  
                ],
              ),
            ),
          ),
           GFCarousel(
             //height: 70,
             enlargeMainPage:true,
             hasPagination: true,
 viewportFraction: 0.8,
 autoPlay:true,
activeIndicator:Colors.white,
passiveIndicator:Colors.grey,
aspectRatio: 2,
    items: imageList.map(
     (url) {
     return Container(
       margin: EdgeInsets.all(8.0),
       
       child: ClipRRect(
         borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Container(
            child: Stack(
              children:[ 
                Image.asset(
                 url,
                 fit: BoxFit.cover,
                  width: 1000.0,
                  height:1000,
              ),
              Center(child: Text("someText",style: TextStyle(color: Colors.white, fontSize: 22))),
              ]
            ),
          )
       )
     );
     }
    ).toList()),


          

          //CarouselList(),
        ]));
  }
}
