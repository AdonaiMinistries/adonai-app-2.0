import 'package:adonai/screens/phone/components/SizeConfig.dart';
import 'package:adonai/screens/phone/navigationbar.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:adonai/screens/phone/app_colors.dart';

class AdonaiBuildingProject extends StatelessWidget {
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
    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
  ];
  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);
    double hb = SizeConfig.blockSizeVertical;
    double wb = SizeConfig.blockSizeHorizontal;
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(60, 25, 60, 25),
            child: FittedBox(
              child: Text(
                "ADONAI BUILDING PROJECT",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[600], fontSize: 20),
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
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 7),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: AssetImage('assets/img1.jpg'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 25, 30, 7),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a fringilla odio. Phasellus sed maximus urna. Curabitur bibendum sollicitudin nisi, sit amet rhoncus massa elementum a. Aliquam erat volutpat. Nullam vitae felis eget ',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[500], fontSize: 15),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.fromLTRB(110, 25, 110, 25),
            child: Text(
              "HOW YOU CAN GET INVOLVED",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[600], fontSize: 25),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 25, 30, 7),
            child: Container(
              padding: EdgeInsets.all(12.0),
              child: GridView.count(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 30,
                crossAxisSpacing: 10,
                // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount: 3,
                //     crossAxisSpacing: 10,
                //     mainAxisSpacing: 10 ,
                // ),
                children: [
                  Container(
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          image: new DecorationImage(
                              image: new AssetImage(imageList[0]),
                              fit: BoxFit.cover))),

                  Container(
                    // height: wb*0.5,
                    // width: hb*0.5,
                    //color: Colors.black,
                      child: Column(
                    children: [
                      Padding(
                        padding:  EdgeInsets.fromLTRB(hb, hb,hb*0.5,hb*0.3 ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'PRAY',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: AppColors.PRIMARY_COLOR, fontSize: wb*7),
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.fromLTRB(hb, hb*0.1, hb*0.5, hb*0.3),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a fringilla odio. Phasellus sed maximus urn ',
                            textAlign: TextAlign.left,
                            //overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: AppColors.PRIMARY_COLOR, fontSize: MediaQuery.of(context).size.width*0.025),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(10, 5, 2, 2),
                          child: ElevatedButton(
                            child: Text(
                              'Prayer Points',
                              style: TextStyle(
                                  color: Colors.grey[500], fontSize: 15),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                              primary: Colors.grey[200],
                              elevation: 5,
                              shadowColor: Colors.grey[100],
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  )
                  ),
                  // decoration: new BoxDecoration(
                  //     borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  //     image: new DecorationImage(
                  //         image: new NetworkImage(images[0]),
                  //
                  //
                  //      fit: BoxFit.cover)))
                  Container(
                      child: Column(
                    children: [
                      Padding(
                        padding:EdgeInsets.fromLTRB(hb, hb,hb*0.5,hb*0.3),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'PROMOTE',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: AppColors.PRIMARY_COLOR, fontSize: wb*7),
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.fromLTRB(hb, hb*0.1, hb*0.5, hb*0.3),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a fringilla odio. Phasellus sed maximus urn ',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: AppColors.PRIMARY_COLOR, fontSize: MediaQuery.of(context).size.width*0.025),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(10, 5, 2, 2),
                          child: ElevatedButton(
                            child: Text(
                              'Share',
                              style: TextStyle(
                                  color: Colors.grey[500], fontSize: 15),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                              primary: Colors.grey[200],
                              elevation: 5,
                              // shadowColor: Colors.grey[100],
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  )),
                  Container(
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          image: new DecorationImage(
                              image: new AssetImage(imageList[1]),
                              fit: BoxFit.cover))),
                  Container(
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          image: new DecorationImage(
                              image: new AssetImage(imageList[2]),
                              fit: BoxFit.cover))),
                  Container(
                      child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(hb, hb,hb*0.5,hb*0.3),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'CONTRIBUTE',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: AppColors.PRIMARY_COLOR, fontSize: wb*5.5),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(hb, hb*0.1, hb*0.5, hb*0.3),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a fringilla odio. Phasellus sed maximus urn ',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: AppColors.PRIMARY_COLOR, fontSize: MediaQuery.of(context).size.width*0.025),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(10, 5, 2, 2),
                          child: ElevatedButton(
                            child: Text(
                              'Give',
                              style: TextStyle(
                                  color: Colors.grey[500], fontSize: 15),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                              primary: Colors.grey[200],
                              elevation: 5,
                              // shadowColor: Colors.grey[100],
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  )),
                ],
              ),
            ),
          ),
        ]));
  }
}
