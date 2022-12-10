import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testapi/models/summonerV4.dart';
import 'package:testapi/service/remote.dart';
import 'dart:convert';
import 'package:testapi/models/summonerV4.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

Future<SummonerV4> getSummoner() async {
  String address =
      'https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/';
  String name = 'yunha0130' + '?';
  String apiKey = 'api_key=' +
      'RGAPI-cb57a744-9600-403f-b5fe-f91a2b5b2fc8';
  final response = await http.get(
      Uri.parse(
          address + name + apiKey));
  if (response.statusCode == 200) {
    return SummonerV4.fromJson(
        jsonDecode(response.body));
  } else {
    throw Exception('Failed to load');
  }
}

class SummonerV4 {
  SummonerV4({
    required this.id,
    required this.accountId,
    required this.puuid,
    required this.name,
    required this.profileIconId,
    required this.revisionDate,
    required this.summonerLevel,
  });

  final String id;
  final String accountId;
  final String puuid;
  final String name;
  final int profileIconId;
  final int revisionDate;
  final int summonerLevel;

  factory SummonerV4.fromJson(
      Map<String, dynamic> json) {
    return SummonerV4(
      id: json["id"],
      accountId: json["accountId"],
      puuid: json["puuid"],
      name: json["name"],
      profileIconId:
          json["profileIconId"],
      revisionDate:
          json["revisionDate"],
      summonerLevel:
          json["summonerLevel"],
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() =>
      _HomePageState();
}

class _HomePageState
    extends State<HomePage> {
  //
  late Future<SummonerV4> summonerData;
  late String puuid;
  late String name;

  @override
  void initState() {
    super.initState();
    summonerData = getSummoner();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text('test')),
      body: Center(
        child: FutureBuilder<
                SummonerV4>(
            future: summonerData,
            builder:
                (context, snapshot) {
              if (snapshot.hasData) {
                puuid = snapshot
                    .data!.puuid;
                name =
                    snapshot.data!.name;
                return Container(
                    child: Column(
                  children: [
                    Text(name),
                    Text(puuid)
                  ],
                ));
              } else if (snapshot
                  .hasError) {
                return Text(
                    '${snapshot.error}');
              }
              return const CircularProgressIndicator();
            }),
      ),
    );
  }
}
