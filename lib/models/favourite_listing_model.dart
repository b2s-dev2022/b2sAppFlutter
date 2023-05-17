class FavouriteListingModel {
  bool? status;
  List<Listings>? listings;
  int? total;

  FavouriteListingModel({this.status, this.listings, this.total});

  FavouriteListingModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['listings'] != null) {
      listings = <Listings>[];
      json['listings'].forEach((v) {
        listings!.add(new Listings.fromJson(v));
      });
    }
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.listings != null) {
      data['listings'] = this.listings!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    return data;
  }
}

class Listings {
  String? id;
  String? imageUrl;
  String? imageTag;
  String? shortHeading;
  String? location;
  String? price;
  String? description;
  List<String>? categories;

  Listings(
      {this.id,
        this.imageUrl,
        this.imageTag,
        this.shortHeading,
        this.location,
        this.price,
        this.description,
        this.categories});

  Listings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['image_url'];
    imageTag = json['imageTag'];
    shortHeading = json['shortHeading'];
    location = json['location'];
    price = json['price'];
    description = json['description'];
    categories = json['categories'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image_url'] = this.imageUrl;
    data['imageTag'] = this.imageTag;
    data['shortHeading'] = this.shortHeading;
    data['location'] = this.location;
    data['price'] = this.price;
    data['description'] = this.description;
    data['categories'] = this.categories;
    return data;
  }
}
