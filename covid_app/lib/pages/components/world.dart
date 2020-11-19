import 'dart:developer';

import 'package:covid_app/models/CovidModel.dart';
import 'package:covid_app/services/covid_manager.dart';
import 'package:flutter/material.dart';

class BodyWorld extends StatefulWidget {
  @override
  _BodyWorldState createState() => _BodyWorldState();
}

class _BodyWorldState extends State<BodyWorld> {

  Future<Covid> _covid;

  @override
  void initState() {
    _covid = Covid_Manager().getTimeline();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
              // width: double.infinity,
        child: FutureBuilder(
          future: _covid,
          builder: (context, snapshot){
            if(snapshot.hasData){
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    height: (size.height - 15) * 0.3,
                    width: double.infinity,
                    color: Colors.black,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "ici ci",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(width: double.infinity, height: size.height * 0.02, ),
                        Text(
                          "Cas dans le monde",
                          style: TextStyle(
                              color: Colors.white,
                              // fontWeight: FontWeight.bold,
                              fontSize: 30
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5, bottom: 5),
                    height: (size.height - 15) * 0.25,
                    width: double.infinity,

                    // color: Colors.blue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 2.5, left: 10),
                              height: (size.height - 15) *0.25,
                              width:  (size.width - 25) * 0.5,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 2.5, right: 10),
                              height: (size.height - 15) *0.25,
                              width: (size.width - 25) * 0.5,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5, bottom: 5),
                    height: (size.height - 15) * 0.25,
                    width: double.infinity,

                    // color: Colors.blue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 2.5, left: 10),
                              height: (size.height - 15) *0.25,
                              width:  (size.width - 25) * 0.5,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 2.5, right: 10),
                              height: (size.height - 15) *0.25,
                              width: (size.width - 25) * 0.5,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Center( child: CircularProgressIndicator(),);
            }
          },

        ),
        // child: Container(
        //   // width: double.infinity,
        //   child: Column(
        //     children: [
        //       Container(
        //         margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
        //         padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        //         height: (size.height - 15) * 0.3,
        //         width: double.infinity,
        //         color: Colors.black,
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             Text(
        //               "ici ci",
        //               style: TextStyle(
        //                   color: Colors.white,
        //                   fontWeight: FontWeight.bold
        //               ),
        //             ),
        //             SizedBox(width: double.infinity, height: size.height * 0.02, ),
        //             Text(
        //               "Cas dans le monde",
        //               style: TextStyle(
        //                   color: Colors.white,
        //                   // fontWeight: FontWeight.bold,
        //                 fontSize: 30
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //       Container(
        //         margin: EdgeInsets.only(top: 5, bottom: 5),
        //         height: (size.height - 15) * 0.25,
        //         width: double.infinity,
        //
        //         // color: Colors.blue,
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             Column(
        //               children: [
        //                 Container(
        //                   margin: EdgeInsets.only(right: 2.5, left: 10),
        //                   height: (size.height - 15) *0.25,
        //                   width:  (size.width - 25) * 0.5,
        //                   color: Colors.black,
        //                 ),
        //               ],
        //             ),
        //             Column(
        //               children: [
        //                 Container(
        //                   margin: EdgeInsets.only(left: 2.5, right: 10),
        //                   height: (size.height - 15) *0.25,
        //                   width: (size.width - 25) * 0.5,
        //                   color: Colors.black,
        //                 ),
        //               ],
        //             ),
        //           ],
        //         ),
        //       ),
        //       Container(
        //         margin: EdgeInsets.only(top: 5, bottom: 5),
        //         height: (size.height - 15) * 0.25,
        //         width: double.infinity,
        //
        //         // color: Colors.blue,
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             Column(
        //               children: [
        //                 Container(
        //                   margin: EdgeInsets.only(right: 2.5, left: 10),
        //                   height: (size.height - 15) *0.25,
        //                   width:  (size.width - 25) * 0.5,
        //                   color: Colors.black,
        //                 ),
        //               ],
        //             ),
        //             Column(
        //               children: [
        //                 Container(
        //                   margin: EdgeInsets.only(left: 2.5, right: 10),
        //                   height: (size.height - 15) *0.25,
        //                   width: (size.width - 25) * 0.5,
        //                   color: Colors.black,
        //                 ),
        //               ],
        //             ),
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
