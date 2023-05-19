class BallotBoxList {
  int? reloadInterval;
  String? school;
  String? district;
  String? city;
  List<BallotBoxes>? ballotBoxes;

  BallotBoxList(
      {this.reloadInterval,
      this.school,
      this.district,
      this.city,
      this.ballotBoxes});

  BallotBoxList.fromJson(Map<String, dynamic> json) {
    reloadInterval = json['reloadInterval'];
    school = json['school'];
    district = json['district'];
    city = json['city'];
    if (json['ballotBoxes'] != null) {
      ballotBoxes = <BallotBoxes>[];
      json['ballotBoxes'].forEach((v) {
        ballotBoxes!.add(BallotBoxes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['reloadInterval'] = reloadInterval;
    data['school'] = school;
    data['district'] = district;
    data['city'] = city;
    if (ballotBoxes != null) {
      data['ballotBoxes'] = ballotBoxes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BallotBoxes {
  int? ballotLabel;
  Cb? cb;
  Cb? mv;

  BallotBoxes({this.ballotLabel, this.cb, this.mv});

  BallotBoxes.fromJson(Map<String, dynamic> json) {
    ballotLabel = json['ballotLabel'];
    cb = json['cb'] != null ? Cb.fromJson(json['cb']) : null;
    mv = json['mv'] != null ? Cb.fromJson(json['mv']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ballotLabel'] = ballotLabel;
    if (cb != null) {
      data['cb'] = cb!.toJson();
    }
    if (mv != null) {
      data['mv'] = mv!.toJson();
    }
    return data;
  }
}

class Cb {
  int? status;
  int? ballotID;

  Cb({this.status, this.ballotID});

  Cb.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    ballotID = json['ballotID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['ballotID'] = ballotID;
    return data;
  }
}