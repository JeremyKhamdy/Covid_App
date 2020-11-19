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
        var array = [];

        var cases_day07 = jsonmap[0]['total_cases'];
        var deaths_days07 = jsonmap[0]['total_deaths'];
        var recovered_days07 = jsonmap[0]['total_recovered'];
        var cases_days01 = jsonmap[6]['total_cases'];
        var deaths_days01 = jsonmap[6]['total_deaths'];
        var recovered_days01 = jsonmap[6]['total_recovered'];

        for(var i = 0; i < 7;i++) {
          array.add(jsonmap[i]);
        }

        var data = [{
          'cases' : cases_day07 - cases_days01,
          'deaths' : deaths_days07 - deaths_days01,
          'recovered' : recovered_days07 - recovered_days01,
          'days' : array
        }];
        var data_encode = json.encode(data);
        var datamap = json.decode(data_encode);

        covid = Covid.fromJson(datamap[0]);
      }
    } catch(Exception) {

      return covid;
    }

    return covid;
  }

}