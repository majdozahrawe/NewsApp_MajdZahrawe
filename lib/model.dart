class NewsUserModel{
  String name=" ";
  String email=" ";
  String phone=" ";
  String uid=" ";
  NewsUserModel({
    required this.email,
    required this.name,
    required this.phone,
    required this.uid,
});

  NewsUserModel.fromJson(Map<String,dynamic>json){
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    uid = json['uid'];

  }

  Map<String,dynamic>toMap(){
    return{
      'name':name,
      'email':email,
      'phone':phone,
      'uid':uid,

    };
  }
}