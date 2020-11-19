
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

      // appBar: AppBar(
      //   flexibleSpace: FlexibleSpaceBar(
      //     collapseMode: CollapseMode.pin,
      //     centerTitle: true,
      //
      //   ),
      //   brightness: Brightness.dark,
      //   toolbarHeight: 250.0,
      //   backgroundColor: Colors.purple[700],
      //   centerTitle: true,
      //   title: Text("COVID 19 Informations", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      // ),
      // body: SingleChildScrollView(
      //   child: Container(
      //     // width: double.infinity,
      //     child: FutureBuilder<Covid>(
      //       future: _covid,
      //       builder: (context, snapshot){
      //         if(snapshot.hasData){
      //
      //           for (var i = 0; i < 7; i++) {
      //             dataCases.add(snapshot.data.days[i].totalCases.toDouble());
      //             dataDeaths.add(snapshot.data.days[i].totalDeaths.toDouble());
      //             dataRecovered.add(snapshot.data.days[i].totalRecovered.toDouble());
      //           }
      //           print(dataCases);
      //           print(dataDeaths);
      //           print(dataRecovered);
      //           return Column(
      //             children: [
      //               ContainerContent(
      //                 number: snapshot.data.cases.toString(),
      //                 text: "Nombres de cas enregistrés ces 7 derniers jours",
      //                 data: dataCases.reversed.toList(),
      //                 numberColor: Colors.blueAccent,
      //                 colors: [Colors.blueAccent, Colors.white70],
      //                 lineColor: Colors.blue,
      //               ),
      //               ContainerContent(
      //                 number: snapshot.data.deaths.toString(),
      //                 text: "Nombres de décès ces 7 derniers jours",
      //                 data: dataDeaths.reversed.toList(),
      //                 numberColor: Colors.redAccent,
      //                 colors: [Colors.redAccent, Colors.white70],
      //                 lineColor: Colors.red,
      //               ),
      //               ContainerContent(
      //                 number: snapshot.data.recovered.toString(),
      //                 text: "Nombres de cas soignés ces 7 derniers jours",
      //                 data: dataRecovered.reversed.toList(),
      //                 numberColor: Colors.greenAccent,
      //                 colors: [Colors.greenAccent, Colors.white70],
      //                 lineColor: Colors.green,
      //               ),
      //             ],
      //           );
      //         } else {
      //           return Center( child: CircularProgressIndicator(),);
      //         }
      //       },
      //     ),
      //   ),
      // ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            centerTitle: true,
            backgroundColor: Colors.purple[700],
            floating: true,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('COVID 19'),
              centerTitle: true,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (contex, index) {
                  return Container(
                    width: double.infinity,
                    child: FutureBuilder<Covid>(
                      future: _covid,
                      builder: (context, snapshot){
                        if(snapshot.hasData){

                          for (var i = 0; i < 7; i++) {
                            dataCases.add(snapshot.data.days[i].totalCases.toDouble());
                            dataDeaths.add(snapshot.data.days[i].totalDeaths.toDouble());
                            dataRecovered.add(snapshot.data.days[i].totalRecovered.toDouble());
                          }

                          return Column(
                            children: [
                              ContainerContent(
                                number: snapshot.data.cases.toString(),
                                text: "Nombres de cas enregistrés ces 7 derniers jours",
                                data: dataCases.reversed.toList(),
                                numberColor: Colors.blueAccent,
                                colors: [Colors.blueAccent, Colors.white70],
                                lineColor: Colors.blue,
                              ),
                              ContainerContent(
                                number: snapshot.data.deaths.toString(),
                                text: "Nombres de décès ces 7 derniers jours",
                                data: dataDeaths.reversed.toList(),
                                numberColor: Colors.redAccent,
                                colors: [Colors.redAccent, Colors.white70],
                                lineColor: Colors.red,
                              ),
                              ContainerContent(
                                number: snapshot.data.recovered.toString(),
                                text: "Nombres de cas soignés ces 7 derniers jours",
                                data: dataRecovered.reversed.toList(),
                                numberColor: Colors.greenAccent,
                                colors: [Colors.greenAccent, Colors.white70],
                                lineColor: Colors.green,
                              ),
                            ],
                          );
                        } else {
                          return Center( child: CircularProgressIndicator(),);
                        }
                      },
                    ),
                  );
                },
              childCount: 1
            ),
          )
        ],
      ),
    );
  }
}
