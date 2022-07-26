import 'package:adonai/screens/phone/components/SizeConfig.dart';
import 'package:adonai/screens/phone/navigationbar.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:adonai/screens/phone/app_colors.dart';

class PrayerNight extends StatelessWidget {
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
    // double _height=MediaQuery.of(context).size.height;
    // double _width=MediaQuery.of(context).size.width;
    double hb = SizeConfig.blockSizeVertical;
    double wb = SizeConfig.blockSizeHorizontal;
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 25, 25, 7),
            child: Text(
              "PRAYER NIGHT",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[500], fontSize: 30),
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

          Center(
            child: Container(
              padding: EdgeInsets.fromLTRB(90, 5, 90, 5),
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
          SizedBox(height: hb * 3),
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(50,10,50,20),
          //   child: Center(
          //     child: Container(
          //       height: MediaQuery.of(context).copyWith().size.height / 9,
          //       padding: EdgeInsets.fromLTRB(90, 5, 90, 5),
          //       decoration: BoxDecoration(
          //           border: Border.all(
          //             color: Colors.grey[300]!,
          //           ),
          //           borderRadius: BorderRadius.all(Radius.circular(20))),
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 10, 50, 20),
            // child: Center(
            child: Container(
              height: MediaQuery.of(context).copyWith().size.height / 9,
              padding: EdgeInsets.fromLTRB(wb * 2, 5, wb * 2, 5),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey[300]!,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: IntrinsicHeight(
                child: Row(
                  children: <Widget>[
                    Container(
                        height: hb * 10,
                        width: hb * 10,
                        child: Column(
                          children: [
                            Text(
                              "24",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColors.PRIMARY_COLOR_DARK,
                                  fontSize: hb * 6.5),
                            ),
                            Text(
                              "OCTOBER",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColors.PRIMARY_COLOR_DARK,
                                  fontSize: hb * 1.5),
                            ),
                          ],
                        )),
                    VerticalDivider(
                      thickness: wb * 0.3,
                      width: wb * 4,
                      indent: hb * 0.8,
                      endIndent: hb * 0.8,
                      color: Colors.grey[300],
                    ),
                    Padding(
                      padding:
                          EdgeInsets.fromLTRB(wb * 0.8, wb * 2.5, wb * 0.5, wb),
                      child: Container(
                          //color: Colors.blue,
                          height: MediaQuery.of(context).size.height * 0.7,
                          width: MediaQuery.of(context).size.width * 0.405,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "PROGRAM THEME",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: AppColors.PRIMARY_COLOR_DARK,
                                    fontSize: MediaQuery.of(context).size.width * 0.045),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.pin_drop,
                                    color: AppColors.RED_COLOR,
                                    size: hb * 2.5,
                                  ),
                                  Text(
                                    "Adonai Church",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: AppColors.PRIMARY_COLOR_DARK,
                                        fontSize: MediaQuery.of(context).size.width * 0.035),
                                  ),
                                ],
                              )
                            ],
                          )),
                    ),
                    // Container(
                    //   color: Colors.blue,
                    //   height: 100,
                    //   width: 100,
                    // ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 10, 50, 20),
            // child: Center(
            child: Container(
              height: MediaQuery.of(context).copyWith().size.height / 9,
              padding: EdgeInsets.fromLTRB(wb * 2, 5, wb * 2, 5),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey[300]!,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: IntrinsicHeight(
                child: Row(
                  children: <Widget>[
                    Container(
                        height: hb * 10,
                        width: hb * 10,
                        child: Column(
                          children: [
                            Text(
                              "24",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColors.PRIMARY_COLOR_DARK,
                                  fontSize: hb * 6.5),
                            ),
                            Text(
                              "OCTOBER",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColors.PRIMARY_COLOR_DARK,
                                  fontSize: hb * 1.5),
                            ),
                          ],
                        )),
                    VerticalDivider(
                      thickness: wb * 0.3,
                      width: wb * 4,
                      indent: hb * 0.8,
                      endIndent: hb * 0.8,
                      color: Colors.grey[300],
                    ),
                    Padding(
                      padding:
                          EdgeInsets.fromLTRB(wb * 0.8, wb * 2.5, wb * 0.5, wb),
                      child: Container(
                        //  _height=MediaQuery.of(context).size.height;
                        //  _width=MediaQuery.of(context).size.width;
                          //color: Colors.blue,
                          height: hb * 10,
                          width: wb * 40,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "PROGRAM THEME",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: AppColors.PRIMARY_COLOR_DARK,
                                    fontSize: MediaQuery.of(context).size.width * 0.045),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.pin_drop,
                                    color: AppColors.RED_COLOR,
                                    size: hb * 2.5,
                                  ),
                                  Text(
                                    "Adonai Church",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: AppColors.PRIMARY_COLOR_DARK,
                                        fontSize:  MediaQuery.of(context).size.width * 0.035),
                                  ),
                                ],
                              )
                            ],
                          )
                          ),
                    ),
                    // Container(
                    //   color: Colors.blue,
                    //   height: 100,
                    //   width: 100,
                    // ),
                  ],
                ),
              ),
            ),
          ),
          //)
        ]));
  }
}
