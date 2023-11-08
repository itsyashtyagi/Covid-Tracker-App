import 'dart:convert';
import 'package:covid_tracker_app/Model/world_stats_model.dart';
import 'package:covid_tracker_app/Services/Utilities/app_url.dart';
import 'package:http/http.dart' as http;

class StatsServices {
  Future<WorldStatsModel> fetchWorldStatsRecords() async {
    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldStatsModel.fromJson(data);
    } else {
      throw Exception('Something went wrong..');
    }
  }

  Future<List<dynamic>> fetchCountryStatsRecords() async {
    var data;
    final response = await http.get(Uri.parse(AppUrl.countriesList));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
      return data;
    } else {
      throw Exception('Something went wrong..');
    }
  }
}
