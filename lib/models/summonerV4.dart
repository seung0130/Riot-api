// // To parse this JSON data, do
// //
// //     final summonerV4 = summonerV4FromJson(jsonString);

// import 'dart:convert';

// SummonerV4 summonerV4FromJson(String str) =>SummonerV4.fromJson(json.decode(str));

// String summonerV4ToJson(
//         SummonerV4 data) =>
//     json.encode(data.toJson());

// class SummonerV4 {
//   SummonerV4({
//     this.id,
//    required this.accountId,
//     this.puuid,
//     this.name,
//     this.profileIconId,
//     this.revisionDate,
//     this.summonerLevel,
//   });

//   String? id;
//   String accountId;
//   String? puuid;
//   String? name;
//   int? profileIconId;
//   int? revisionDate;
//   int? summonerLevel;

//   factory SummonerV4.fromJson(
//           Map<String, dynamic> json) =>
//       SummonerV4(
//         id: json["id"],
//         accountId: json["accountId"],
//         puuid: json["puuid"],
//         name: json["name"],
//         profileIconId:
//             json["profileIconId"],
//         revisionDate:
//             json["revisionDate"],
//         summonerLevel:
//             json["summonerLevel"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "accountId": accountId,
//         "puuid": puuid,
//         "name": name,
//         "profileIconId": profileIconId,
//         "revisionDate": revisionDate,
//         "summonerLevel": summonerLevel,
//       };
// }
