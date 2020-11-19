// To parse this JSON data, do
//
//     final covid = covidFromJson(jsonString);

import 'dart:convert';

Covid covidFromJson(String str) => Covid.fromJson(json.decode(str));

String covidToJson(Covid data) => json.encode(data.toJson());

class Covid {
  Covid({
    this.cases,
    this.deaths,
    this.recovered,
    this.days,
  });

  int cases;
  int deaths;
  int recovered;
  List<Day> days;

  factory Covid.fromJson(Map<String, dynamic> json) => Covid(
    cases: json["cases"],
    deaths: json["deaths"],
    recovered: json["recovered"],
    days: List<Day>.from(json["days"].map((x) => Day.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "cases": cases,
    "deaths": deaths,
    "recovered": recovered,
    "days": List<dynamic>.from(days.map((x) => x.toJson())),
  };
}

class Day {
  Day({
    this.lastUpdate,
    this.totalCases,
    this.totalDeaths,
    this.totalRecovered,
  });

  DateTime lastUpdate;
  int totalCases;
  int totalDeaths;
  int totalRecovered;

  factory Day.fromJson(Map<String, dynamic> json) => Day(
    lastUpdate: DateTime.parse(json["last_update"]),
    totalCases: json["total_cases"],
    totalDeaths: json["total_deaths"],
    totalRecovered: json["total_recovered"],
  );

  Map<String, dynamic> toJson() => {
    "last_update": lastUpdate.toIso8601String(),
    "totalCases": totalCases,
    "totalDeaths": totalDeaths,
    "totalRecovered": totalRecovered,
  };
}
