class getMemberLevelResponse {
  String? status;
  String? message;
  List<Data>? data;

  getMemberLevelResponse({this.status, this.message, this.data});

  getMemberLevelResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? durasiMenit;
  String? durasiJam;
  String? branch;
  String? levelID;
  String? levelName;
  String? minHour;
  String? rewardPoint;
  String? nextLevelName;
  String? nextMinHour;
  String? nextRewardPoint;
  String? sisaNextHour;

  Data(
      {this.durasiMenit,
        this.durasiJam,
        this.branch,
        this.levelID,
        this.levelName,
        this.minHour,
        this.rewardPoint,
        this.nextLevelName,
        this.nextMinHour,
        this.nextRewardPoint,
        this.sisaNextHour});

  Data.fromJson(Map<String, dynamic> json) {
    durasiMenit = json['DurasiMenit'];
    durasiJam = json['DurasiJam'];
    branch = json['Branch'];
    levelID = json['LevelID'];
    levelName = json['LevelName'];
    minHour = json['MinHour'];
    rewardPoint = json['RewardPoint'];
    nextLevelName = json['NextLevelName'];
    nextMinHour = json['NextMinHour'];
    nextRewardPoint = json['NextRewardPoint'];
    sisaNextHour = json['SisaNextHour'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DurasiMenit'] = this.durasiMenit;
    data['DurasiJam'] = this.durasiJam;
    data['Branch'] = this.branch;
    data['LevelID'] = this.levelID;
    data['LevelName'] = this.levelName;
    data['MinHour'] = this.minHour;
    data['RewardPoint'] = this.rewardPoint;
    data['NextLevelName'] = this.nextLevelName;
    data['NextMinHour'] = this.nextMinHour;
    data['NextRewardPoint'] = this.nextRewardPoint;
    data['SisaNextHour'] = this.sisaNextHour;
    return data;
  }
}