class LoginModel {
  bool? status;
  bool? email;
  String? msg;

  LoginModel({this.status, this.email, this.msg});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    email = json['email'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['email'] = this.email;
    data['msg'] = this.msg;
    return data;
  }
}
