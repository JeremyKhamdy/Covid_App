// To parse this JSON data, do
//
//     final covid = covidFromJson(jsonString);

import 'dart:convert';

List<Covid> covidFromJson(String str) => List<Covid>.from(json.decode(str).map((x) => Covid.fromJson(x)));

String covidToJson(List<Covid> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Covid {
  Covid({
    this.lastUpdate,
    this.totalCases,
    this.totalDeaths,
    this.totalRecovered,
  });

  DateTime lastUpdate;
  int totalCases;
  int totalDeaths;
  int totalRecovered;

  factory Covid.fromJson(Map<String, dynamic> json) => Covid(
    lastUpdate: DateTime.parse(json["last_update"]),
    totalCases: json["total_cases"],
    totalDeaths: json["total_deaths"],
    totalRecovered: json["total_recovered"],
  );

  Map<String, dynamic> toJson() => {
    "last_update": lastUpdate.toIso8601String(),
    "total_cases": totalCases,
    "total_deaths": totalDeaths,
    "total_recovered": totalRecovered,
  };
}