class AllahNames {
  List<Names>? names;

  AllahNames({this.names});

  AllahNames.fromJson(Map<String, dynamic> json) {
    if (json['names'] != null) {
      names = <Names>[];
      json['names'].forEach((v) {
        names!.add(new Names.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.names != null) {
      data['names'] = this.names!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MuhammadNames {
  List<Names>? names;

  MuhammadNames({this.names});

  MuhammadNames.fromJson(Map<String, dynamic> json) {
    if (json['names'] != null) {
      names = <Names>[];
      json['names'].forEach((v) {
        names!.add(new Names.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.names != null) {
      data['names'] = this.names!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Names {
  String? arabic;
  String? romanized;

  Names({this.arabic, this.romanized});

  Names.fromJson(Map<String, dynamic> json) {
    arabic = json['arabic'];
    romanized = json['romanized'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['arabic'] = this.arabic;
    data['romanized'] = this.romanized;
    return data;
  }
}
