

class izlenecek {
  int id;
  String adi;
  String icerik;
  bool bittiMi;


  izlenecek({this.id, this.adi, this.icerik, this.bittiMi});

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
   if(id !=null){
     map["id"] = id;
   }
    map["title"] = adi;
    map["description"] = icerik;
    map["isDone"] = bittiMi ? 1 : 0;
    return map;
  }

  factory izlenecek.fromMap(Map<String,dynamic> map){
    return izlenecek(
      id: map["id"],
      adi: map["title"],
      icerik: map["description"],
      bittiMi: map["isDone"]==1);


  }
}
