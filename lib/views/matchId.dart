import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:flutter/rendering.dart';
import 'package:testapi/views/matchInfo.dart';

List<String> matchIdFromJson(
        String str) =>
    List<String>.from(
        json.decode(str).map((x) => x));

String matchIdToJson(
        List<String> data) =>
    json.encode(List<dynamic>.from(
        data.map((x) => x)));

// class MatchId {
//   late String matchId;

//   MatchId({
//     required this.matchId,
//   });

//   factory MatchId.fromJson(
//       Map<String, dynamic> json) {
//     return MatchId(
//       matchId: json[''],
//     );
//   }
// }

class Remote {
  String address =
      'https://asia.api.riotgames.com/lol/match/v5/matches/by-puuid/';
  String puuid =
      'bYx6r9Wfxjg0MUOln9lHDcbK8qa21-_PNL4P_lyLD44R7S_H40LPaYNKa53oC_T6WoaRFlR_FqXnqA';
  String count = '/ids?start=0&count=' +
      '100' +
      '&';
  String apiKey = 'api_key=' +
      'RGAPI-cb57a744-9600-403f-b5fe-f91a2b5b2fc8';

  Future<List<String>?>
      getIdList() async {
    var client = http.Client();

    var uri = Uri.parse(address +
        puuid +
        count +
        apiKey);
    var response =
        await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      return matchIdFromJson(json);
    }
  }
}

class MatchIdPage
    extends StatefulWidget {
  const MatchIdPage({super.key});

  @override
  State<MatchIdPage> createState() =>
      _MatchIdPageState();
}

class _MatchIdPageState
    extends State<MatchIdPage> {
  List<String>? mid;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    mid = await Remote().getIdList();
    if (mid != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MatchID'),
      ),
      body: Text(mid![0]),
    );
  }
}
