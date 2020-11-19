
import 'dart:ui';
import 'package:covid_app/components/container_content.dart';
import 'package:covid_app/models/CovidModel.dart';
import 'package:covid_app/services/covid_manager.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int currentIndex = 0;
  List<double> dataCases = [];
  List<double> dataDeaths = [];
  List<double> dataRecovered = [];
  Future <Covid> _covid;

  @override
  void initState() {
    _covid = Covid_Manager().getTimeline();
    dataCases = [];
    dataDeaths = [];
    dataRecovered = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white54,
        centerTitle: true,
        title: Text("COVID APP", style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        child: Container(
          // width: double.infinity,
          child: FutureBuilder<Covid>(
            future: _covid,
            builder: (context, snapshot){
              if(snapshot.hasData){

                for (var i = 0; i < 7; i++) {
                  dataCases.add(snapshot.data.days[i].totalCases.toDouble());
                  dataDeaths.add(snapshot.data.days[i].totalDeaths.toDouble());
                  dataRecovered.add(snapshot.data.days[i].totalRecovered.toDouble());
                }
                print(dataCases);
                print(dataDeaths);
                print(dataRecovered);
                return Column(
                  children: [
                    ContainerContent(
                      number: snapshot.data.cases.toString().substring(0,4),
                      text: "Nombres de cas enregistrés ces 7 derniers jours",
                      data: dataCases.reversed.toList(),
                      numberColor: Colors.blueAccent,
                    ),
                    ContainerContent(
                      number: snapshot.data.deaths.toString(),
                      text: "Nombres de décès ces 7 derniers jours",
                      data: dataDeaths.reversed.toList(),
                      numberColor: Colors.redAccent,
                    ),
                    ContainerContent(
                      number: snapshot.data.recovered.toString(),
                      text: "Nombres de cas soignés ces 7 derniers jours",
                      data: dataRecovered.reversed.toList(),
                      numberColor: Colors.greenAccent,
                    ),
                    // Container(
                    //   margin: EdgeInsets.only(top: 5, bottom: 5),
                    //   height: (size.height - 15) * 0.25,
                    //   width: double.infinity,
                    //
                    //   // color: Colors.blue,
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Column(
                    //         children: [
                    //           Container(
                    //             margin: EdgeInsets.only(right: 2.5, left: 10),
                    //             height: (size.height - 15) *0.25,
                    //             width:  (size.width - 25) * 0.5,
                    //             color: Colors.black,
                    //           ),
                    //         ],
                    //       ),
                    //       Column(
                    //         children: [
                    //           Container(
                    //             margin: EdgeInsets.only(left: 2.5, right: 10),
                    //             height: (size.height - 15) *0.25,
                    //             width: (size.width - 25) * 0.5,
                    //             color: Colors.black,
                    //           ),
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                );
              } else {
                return Center( child: CircularProgressIndicator(),);
              }
            },
          ),
        ),
      ),
    );
  }
}
