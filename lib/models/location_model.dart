/// locations : [{"locid":"qld/gold-coast","name":"Gold Coast, Queensland"}]

class LocationModel {
  LocationModel({
      List<Locations>? locations,}){
    _locations = locations;
}

  LocationModel.fromJson(dynamic json) {
    if (json['locations'] != null) {
      _locations = [];
      json['locations'].forEach((v) {
        _locations?.add(Locations.fromJson(v));
      });
    }
  }
  List<Locations>? _locations;
LocationModel copyWith({  List<Locations>? locations,
}) => LocationModel(  locations: locations ?? _locations,
);
  List<Locations>? get locations => _locations;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_locations != null) {
      map['locations'] = _locations?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// locid : "qld/gold-coast"
/// name : "Gold Coast, Queensland"

class Locations {
  Locations({
      String? locid, 
      String? name,}){
    _locid = locid;
    _name = name;
}

  Locations.fromJson(dynamic json) {
    _locid = json['locid'];
    _name = json['name'];
  }
  String? _locid;
  String? _name;
Locations copyWith({  String? locid,
  String? name,
}) => Locations(  locid: locid ?? _locid,
  name: name ?? _name,
);
  String? get locid => _locid;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['locid'] = _locid;
    map['name'] = _name;
    return map;
  }

}