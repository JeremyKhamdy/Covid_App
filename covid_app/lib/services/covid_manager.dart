import 'dart:convert';

import 'package:covid_app/constants/strings.dart';
import 'package:covid_app/models/CovidModel.dart';
import 'package:http/http.dart' as http;

class Covid_Manager {

  Future<Covid> getTimeline() async {
    var client = http.Client();
    var covid = null;

    try{
      var response = await client.get(Strings.covid_url);
      if(response.statusCode == 200){
        var jsonString = response.body;
        var jsonmap = json.decode(jsonString);
        covid = Covid.fromJson(jsonmap);
      }
    } catch(Exception) {
        return covid;
    }

    return covid;
  }

}