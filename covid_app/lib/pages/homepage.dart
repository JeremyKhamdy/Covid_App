
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
  Color action = Colors.black38;
  Icon actionIcon = new Icon(Icons.refresh);

  @override
  void initState() {
    _covid = Covid_Manager().getTimeline();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            centerTitle: true,
            backgroundColor: Colors.white38,
            floating: true,
            // expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('COVID 19', style: TextStyle(color: Colors.black38),),
              centerTitle: true,
            ),
            actions: [
              IconButton(
                icon: actionIcon,
                color: action,
                onPressed: (){
                  setState(() {
                    _covid = Covid_Manager().getTimeline();
                  });
                },
              )
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (contex, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white38
                    ),
                    width: double.infinity,
                    child: FutureBuilder<Covid>(
                      future: _covid,
                      builder: (context, snapshot){
                        if(snapshot.hasData){
                          if (dataCases.isEmpty && dataDeaths.isEmpty && dataRecovered.isEmpty){
                            for (var i = 0; i < 7; i++) {
                                dataCases.add(snapshot.data.days[i].totalCases.toDouble());
                                dataDeaths.add(snapshot.data.days[i].totalDeaths.toDouble());
                                dataRecovered.add(snapshot.data.days[i].totalRecovered.toDouble());
                            }
                          }
                          return Column(
                            children: [
                              Container(
                                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                  width: double.infinity,
                                  height: /*size.height * 0.1*/ 100,
                                  decoration: BoxDecoration(
                                      // color: Colors.white24
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    // mainAxisAlignment: MainAxisAlignment.,
                                    children: [
                                      Text(
                                        "Toutes les informations relatives sur le COVID 19 dans le monde." +
                                        "Le nombre de cas, de cas soigné ainsi que le nombre de décès enregistrés.",
                                        style: TextStyle(color: Colors.black26),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  )

                              ),
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
                                mb: 10.0,
                              ),
                            ],
                          );
                        } else {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator()
                            ],
                          );
                        }
                      },
                    ),
                  );
                },
              childCount: 1,
            ),
          )
        ],
      ),
    );
  }
}
