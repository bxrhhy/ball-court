class Player {
  Player({
       this.userId,
       this.name,
       this.num,});

  Player.fromJson(dynamic json) {
    userId = json['userId'];
    name = json['name'];
    num = json['num'];
  }
  String? userId;
  String? name;
  int? num;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['name'] = name;
    map['num'] = num;
    return map;
  }

}