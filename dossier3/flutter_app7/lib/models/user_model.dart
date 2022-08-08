class UserModel {
  int id;
  String name;
  String email;
  String cin;
  String mobile;
  String createdAt;

  UserModel({this.id,this.name, this.email, this.cin, this.mobile, this.createdAt});

  UserModel.fromJson(Map<String, dynamic> json) {
    id= json['id'];
    name = json['name'];
    email = json['email'];
    cin = json['cin'];
    mobile = json['mobile'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id']= this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['cin'] = this.cin;
    data['mobile'] = this.mobile;
    data['created_at'] = this.createdAt;
    return data;
  }
}
