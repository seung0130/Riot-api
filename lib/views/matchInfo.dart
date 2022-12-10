import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/src/widgets/container.dart';

import 'package:http/http.dart' as http;

// Future<MatchInfo> getSummoner() async {
//   final response = await http.get(
//       Uri.parse('https://asia.api.riotgames.com/lol/match/v5/matches/KR_6234609890?api_key=RGAPI-cb57a744-9600-403f-b5fe-f91a2b5b2fc8'));
//   if (response.statusCode == 200) {
//     return MatchInfo.fromJson(
//         jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to load');
//   }
// }

class Remote {
  Future<List<MatchInfo>?>
      getInfo() async {
    var client = http.Client();

    var uri = Uri.parse(
        'https://asia.api.riotgames.com/lol/match/v5/matches/KR_6234609890?api_key=RGAPI-cb57a744-9600-403f-b5fe-f91a2b5b2fc8');
    var response =
        await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      return matchInfoFromJson(json);
    }
  }
}

// MatchInfo matchInfoFromJson(
//         String str) =>
//     MatchInfo.fromJson(
//         json.decode(str));

// String matchInfoToJson(
//         MatchInfo data) =>
//     json.encode(data.toJson());

List<MatchInfo> matchInfoFromJson(
        String str) =>
    List<MatchInfo>.from(
        json.decode(str).map((x) => x));

String matchInfoToJson(
        List<MatchInfo> data) =>
    json.encode(List<dynamic>.from(
        data.map((x) => x)));

class MatchInfo {
  MatchInfo({
    required this.metadata,
    required this.info,
  });

  Metadata metadata;
  Info info;

  factory MatchInfo.fromJson(
          Map<String, dynamic> json) =>
      MatchInfo(
        metadata: Metadata.fromJson(
            json["metadata"]),
        info:
            Info.fromJson(json["info"]),
      );

  Map<String, dynamic> toJson() => {
        "metadata": metadata.toJson(),
        "info": info.toJson(),
      };
}

class Info {
  Info({
    required this.participants,
  });

  List<Participant> participants;

  factory Info.fromJson(
          Map<String, dynamic> json) =>
      Info(
        participants:
            List<Participant>.from(json[
                    "participants"]
                .map((x) => Participant
                    .fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "participants":
            List<dynamic>.from(
                participants.map(
                    (x) => x.toJson())),
      };
}

class Participant {
  Participant({
    required this.champExperience,
    required this.champLevel,
    required this.championId,
    required this.championName,
    required this.championTransform,
    required this.item0,
    required this.item1,
    required this.item2,
    required this.item3,
    required this.item4,
    required this.item5,
    required this.item6,
    required this.itemsPurchased,
    required this.participantId,
    required this.puuid,
    required this.summonerId,
    required this.summonerLevel,
    required this.summonerName,
    required this.win,
  });

  int champExperience;
  int champLevel;
  int championId;
  String championName;
  int championTransform;

  int item0;
  int item1;
  int item2;
  int item3;
  int item4;
  int item5;
  int item6;
  int itemsPurchased;

  int participantId;

  String puuid;

  String summonerId;
  int summonerLevel;
  String summonerName;

  bool win;

  factory Participant.fromJson(
          Map<String, dynamic> json) =>
      Participant(
        champExperience:
            json["champExperience"],
        champLevel: json["champLevel"],
        championId: json["championId"],
        championName:
            json["championName"],
        championTransform:
            json["championTransform"],
        item0: json["item0"],
        item1: json["item1"],
        item2: json["item2"],
        item3: json["item3"],
        item4: json["item4"],
        item5: json["item5"],
        item6: json["item6"],
        itemsPurchased:
            json["itemsPurchased"],
        participantId:
            json["participantId"],
        puuid: json["puuid"],
        summonerId: json["summonerId"],
        summonerLevel:
            json["summonerLevel"],
        summonerName:
            json["summonerName"],
        win: json["win"],
      );

  Map<String, dynamic> toJson() => {
        "champExperience":
            champExperience,
        "champLevel": champLevel,
        "championId": championId,
        "championName": championName,
        "championTransform":
            championTransform,
        "item0": item0,
        "item1": item1,
        "item2": item2,
        "item3": item3,
        "item4": item4,
        "item5": item5,
        "item6": item6,
        "itemsPurchased":
            itemsPurchased,
        "participantId": participantId,
        "puuid": puuid,
        "summonerId": summonerId,
        "summonerLevel": summonerLevel,
        "summonerName": summonerName,
        "win": win,
      };
}

class Metadata {
  Metadata({
    required this.dataVersion,
    required this.matchId,
    required this.participants,
  });

  String dataVersion;
  String matchId;
  List<String> participants;

  factory Metadata.fromJson(
          Map<String, dynamic> json) =>
      Metadata(
        dataVersion:
            json["dataVersion"],
        matchId: json["matchId"],
        participants: List<String>.from(
            json["participants"]
                .map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "dataVersion": dataVersion,
        "matchId": matchId,
        "participants":
            List<dynamic>.from(
                participants
                    .map((x) => x)),
      };
}

class MatchInfoPage
    extends StatefulWidget {
  const MatchInfoPage({super.key});

  @override
  State<MatchInfoPage> createState() =>
      _MatchInfoPageState();
}

class _MatchInfoPageState
    extends State<MatchInfoPage> {
  List<MatchInfo>? match;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    match = await Remote().getInfo();
    if (match != null) {
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
    );
  }
}
