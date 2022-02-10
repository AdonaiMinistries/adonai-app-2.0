

import 'package:adonai/screens/phone/components/cellgroupdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget circleCell(CellGroupData cell, BuildContext context){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child:Column(
      children:[
        InkWell(
          borderRadius: BorderRadius.circular(50.0),
          onTap:(){

          },
          child:Container(
            width:70,
            height:70.0,
            decoration:BoxDecoration(
              borderRadius:BorderRadius.circular(50.0),
              //border:Border.all(color:Colors.black,width:2.0),
              ),
              child:Padding(
                padding:EdgeInsets.all(3.0),
                child:Container(
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    image:DecorationImage(
                      image:AssetImage(
              cell.img),
              fit:BoxFit.cover,

                     
                    ),
                    )
                  )
                )
              )
          ),

        SizedBox(height:6.0),
        Text(cell.name),
      ]
    )
  );
}