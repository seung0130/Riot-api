import 'dart:convert';

import 'package:testapi/models/summonerV4.dart';
import 'package:http/http.dart' as http;

// Future<SummonerV4> getSummoner() async {
//   final response = await http.get(Uri.parse(
//       'https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/yunha0130?api_key=RGAPI-c92fc90d-f667-448f-bfa9-39e145903fe1'));
//   if (response.statusCode == 200) {
//     return SummonerV4.fromJson(
//         jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to load');
//   }
// }
