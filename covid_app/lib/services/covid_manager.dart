import 'dart:convert';
import 'dart:developer';

import 'package:covid_app/constants/strings.dart';
import 'package:covid_app/models/CovidModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Covid_Manager {

  Future<Covid> getTimeline() async {
    var client = http.Client();
    var covid = null;
    var total_recovered = 0;
    var total_deaths = 0;
    var total_cases = 0;
    var total_recovered1 = 0;
    var total_deaths1 = 0;
    var total_cases1 = 0;

    try{
      var response = await client.get(Strings.covid_url);
      if(response.statusCode == 200){
        var jsonString = response.body;
        var jsonmap = json.decode(jsonString);
        var array = [];

        total_cases = jsonmap[0]['total_cases'];
        total_deaths = jsonmap[0]['total_deaths'];
        total_recovered = jsonmap[0]['total_recovered'];
        total_cases1 = jsonmap[6]['total_cases'];
        total_deaths1 = jsonmap[6]['total_deaths'];
        total_recovered1 = jsonmap[6]['total_recovered'];

        for(var i = 0; i < 7;i++) {
          array.add(jsonmap[i]);
        }

        // print(total_cases);
        // print(total_deaths);
        // print(total_recovered);
        // print(array);
        var data = [{
          'cases' : total_cases - total_cases1,
          'deaths' : total_deaths - total_deaths1,
          'recovered' : total_recovered - total_recovered1,
          'days' : array
        }];
        var data_encode = json.encode(data);
        var datamap = json.decode(data_encode);
        print(datamap[0]["days"]);
        covid = Covid.fromJson(datamap[0]);
        // print(covid);
      }
    } catch(Exception) {

      return covid;
    }

    return covid;
  }

}