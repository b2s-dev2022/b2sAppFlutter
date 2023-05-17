class LoginSuccessModel {
  bool? authenticatedAsBuyer;
  AuthenticatedBuyer? authenticatedBuyer;

  LoginSuccessModel({this.authenticatedAsBuyer, this.authenticatedBuyer});

  LoginSuccessModel.fromJson(Map<String, dynamic> json) {
    authenticatedAsBuyer = json['AuthenticatedAsBuyer'];
    authenticatedBuyer = json['AuthenticatedBuyer'] != null
        ? new AuthenticatedBuyer.fromJson(json['AuthenticatedBuyer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AuthenticatedAsBuyer'] = this.authenticatedAsBuyer;
    if (this.authenticatedBuyer != null) {
      data['AuthenticatedBuyer'] = this.authenticatedBuyer!.toJson();
    }
    return data;
  }
}

class AuthenticatedBuyer {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? password;
  String? status;
  String? emailStatus;
  String? guest;
  String? ipAddress;
  String? countryId;
  String? blacklist;
  String? info;
  String? callx;
  Null? action;
  String? addedDate;
  Null? uniqLoginId;

  AuthenticatedBuyer(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.password,
        this.status,
        this.emailStatus,
        this.guest,
        this.ipAddress,
        this.countryId,
        this.blacklist,
        this.info,
        this.callx,
        this.action,
        this.addedDate,
        this.uniqLoginId});

  AuthenticatedBuyer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    status = json['status'];
    emailStatus = json['email_status'];
    guest = json['guest'];
    ipAddress = json['ip_address'];
    countryId = json['country_id'];
    blacklist = json['blacklist'];
    info = json['info'];
    callx = json['callx'];
    action = json['action'];
    addedDate = json['added_date'];
    uniqLoginId = json['uniq_login_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['status'] = this.status;
    data['email_status'] = this.emailStatus;
    data['guest'] = this.guest;
    data['ip_address'] = this.ipAddress;
    data['country_id'] = this.countryId;
    data['blacklist'] = this.blacklist;
    data['info'] = this.info;
    data['callx'] = this.callx;
    data['action'] = this.action;
    data['added_date'] = this.addedDate;
    data['uniq_login_id'] = this.uniqLoginId;
    return data;
  }
}
