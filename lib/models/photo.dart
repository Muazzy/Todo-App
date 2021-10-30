class Photo {
  int id;
  String photoName;
  Photo({this.id, this.photoName});

  //this will convert the data into a Map
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'photoName': photoName,
    };
    return map;
  }

  //it will convert the map into the desired data, so it just basically reverse the action of toMap function
  Photo.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    photoName = map['photoName'];
  }
}
