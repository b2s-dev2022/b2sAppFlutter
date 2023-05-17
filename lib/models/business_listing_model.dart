// class BusinessListingModel {
//   String? pagetitle;
//   int? totallisting;
//   int? currentPage;
//   String? nextPageNumber;
//   int? lastpage;
//   List<Listings>? listings;
//
//   BusinessListingModel(
//       {this.pagetitle,
//         this.totallisting,
//         this.currentPage,
//         this.nextPageNumber,
//         this.lastpage,
//         this.listings});
//
//   BusinessListingModel.fromJson(Map<String, dynamic> json) {
//     pagetitle = json['pagetitle'];
//     totallisting = json['totallisting'];
//     currentPage = json['currentPage'];
//     nextPageNumber = json['nextPageNumber'];
//     lastpage = json['lastpage'];
//     if (json['listings'] != null) {
//       listings = <Listings>[];
//       json['listings'].forEach((v) {
//         listings!.add(new Listings.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['pagetitle'] = this.pagetitle;
//     data['totallisting'] = this.totallisting;
//     data['currentPage'] = this.currentPage;
//     data['nextPageNumber'] = this.nextPageNumber;
//     data['lastpage'] = this.lastpage;
//     if (this.listings != null) {
//       data['listings'] = this.listings!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Listings {
//   int? id;
//   String? pageUrl;
//   String? imageUrl;
//   String? heading;
//   String? imageTag;
//   String? heading1;
//   String? location;
//   String? price;
//   String? description;
//   String? catename;
//   List<String>? multicate;
//   Null? ssbLogo;
//   String? logo;
//   String? type;
//   String? link;
//   List<MultiImages>? multiImages;
//
//   Listings(
//       {this.id,
//         this.pageUrl,
//         this.imageUrl,
//         this.heading,
//         this.imageTag,
//         this.heading1,
//         this.location,
//         this.price,
//         this.description,
//         this.catename,
//         this.multicate,
//         this.ssbLogo,
//         this.logo,
//         this.type,
//         this.link,
//         this.multiImages});
//
//   Listings.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     pageUrl = json['page_url'];
//     imageUrl = json['image_url'];
//     heading = json['heading'];
//     imageTag = json['imageTag'];
//     heading1 = json['heading1'];
//     location = json['location'];
//     price = json['price'];
//     description = json['description'];
//     catename = json['catename'];
//     multicate = json['multicate'].cast<String>();
//     ssbLogo = json['ssbLogo'];
//     logo = json['logo'];
//     type = json['type'];
//     link = json['link'];
//     if (json['multi_images'] != null) {
//       multiImages = <MultiImages>[];
//       json['multi_images'].forEach((v) {
//         multiImages!.add(new MultiImages.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['page_url'] = this.pageUrl;
//     data['image_url'] = this.imageUrl;
//     data['heading'] = this.heading;
//     data['imageTag'] = this.imageTag;
//     data['heading1'] = this.heading1;
//     data['location'] = this.location;
//     data['price'] = this.price;
//     data['description'] = this.description;
//     data['catename'] = this.catename;
//     data['multicate'] = this.multicate;
//     data['ssbLogo'] = this.ssbLogo;
//     data['logo'] = this.logo;
//     data['type'] = this.type;
//     data['link'] = this.link;
//     if (this.multiImages != null) {
//       data['multi_images'] = this.multiImages!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class MultiImages {
//   String? orderID;
//   String? smallImage;
//   String? image;
//   String? lrgImage;
//
//   MultiImages({this.orderID, this.smallImage, this.image, this.lrgImage});
//
//   MultiImages.fromJson(Map<String, dynamic> json) {
//     orderID = json['orderID'];
//     smallImage = json['small_image'];
//     image = json['image'];
//     lrgImage = json['lrg_image'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['orderID'] = this.orderID;
//     data['small_image'] = this.smallImage;
//     data['image'] = this.image;
//     data['lrg_image'] = this.lrgImage;
//     return data;
//   }
// }


class BusinessListingModel {
  String? pagetitle;
  String? similarListing;
  int? totallisting;
  int? currentPage;
  String? nextPageNumber;
  int? lastpage;
  List<Listings>? listings;
  List<Filtercategories>? filtercategories;

  BusinessListingModel(
      {this.pagetitle,
        this.similarListing,
        this.totallisting,
        this.currentPage,
        this.nextPageNumber,
        this.lastpage,
        this.listings,
        this.filtercategories});

  BusinessListingModel.fromJson(Map<String, dynamic> json) {
    pagetitle = json['pagetitle'];
    similarListing = json['similarListing'];
    totallisting = json['totallisting'];
    currentPage = json['currentPage'];
    nextPageNumber = json['nextPageNumber'];
    lastpage = json['lastpage'];
    if (json['listings'] != null) {
      listings = <Listings>[];
      json['listings'].forEach((v) {
        listings!.add(new Listings.fromJson(v));
      });
    }
    if (json['filtercategories'] != null) {
      filtercategories = <Filtercategories>[];
      json['filtercategories'].forEach((v) {
        filtercategories!.add(new Filtercategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pagetitle'] = this.pagetitle;
    data['similarListing'] = this.similarListing;
    data['totallisting'] = this.totallisting;
    data['currentPage'] = this.currentPage;
    data['nextPageNumber'] = this.nextPageNumber;
    data['lastpage'] = this.lastpage;
    if (this.listings != null) {
      data['listings'] = this.listings!.map((v) => v.toJson()).toList();
    }
    if (this.filtercategories != null) {
      data['filtercategories'] =
          this.filtercategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Listings {
  int? id;
  String? pageUrl;
  String? imageUrl;
  String? heading;
  String? imageTag;
  String? heading1;
  String? location;
  String? price;
  String? description;
  String? catename;
  List<String>? multicate;
  Null? ssbLogo;
  String? logo;
  String? type;
  String? link;
  List<MultiImages>? multiImages;

  Listings(
      {this.id,
        this.pageUrl,
        this.imageUrl,
        this.heading,
        this.imageTag,
        this.heading1,
        this.location,
        this.price,
        this.description,
        this.catename,
        this.multicate,
        this.ssbLogo,
        this.logo,
        this.type,
        this.link,
        this.multiImages});

  Listings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pageUrl = json['page_url'];
    imageUrl = json['image_url'];
    heading = json['heading'];
    imageTag = json['imageTag'];
    heading1 = json['heading1'];
    location = json['location'];
    price = json['price'];
    description = json['description'];
    catename = json['catename'];
    multicate = json['multicate'].cast<String>();
    ssbLogo = json['ssbLogo'];
    logo = json['logo'];
    type = json['type'];
    link = json['link'];
    if (json['multi_images'] != null) {
      multiImages = <MultiImages>[];
      json['multi_images'].forEach((v) {
        multiImages!.add(new MultiImages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['page_url'] = this.pageUrl;
    data['image_url'] = this.imageUrl;
    data['heading'] = this.heading;
    data['imageTag'] = this.imageTag;
    data['heading1'] = this.heading1;
    data['location'] = this.location;
    data['price'] = this.price;
    data['description'] = this.description;
    data['catename'] = this.catename;
    data['multicate'] = this.multicate;
    data['ssbLogo'] = this.ssbLogo;
    data['logo'] = this.logo;
    data['type'] = this.type;
    data['link'] = this.link;
    if (this.multiImages != null) {
      data['multi_images'] = this.multiImages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MultiImages {
  String? orderID;
  String? smallImage;
  String? image;
  String? lrgImage;

  MultiImages({this.orderID, this.smallImage, this.image, this.lrgImage});

  MultiImages.fromJson(Map<String, dynamic> json) {
    orderID = json['orderID'];
    smallImage = json['small_image'];
    image = json['image'];
    lrgImage = json['lrg_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderID'] = this.orderID;
    data['small_image'] = this.smallImage;
    data['image'] = this.image;
    data['lrg_image'] = this.lrgImage;
    return data;
  }
}

class Filtercategories {
  String? catName;
  String? catid;
  String? caturl;
  List<SubCat>? subCat;

  Filtercategories({this.catName, this.catid, this.caturl, this.subCat});

  Filtercategories.fromJson(Map<String, dynamic> json) {
    catName = json['catName'];
    catid = json['catid'];
    caturl = json['caturl'];
    if (json['SubCat'] != null) {
      subCat = <SubCat>[];
      json['SubCat'].forEach((v) {
        subCat!.add(new SubCat.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['catName'] = this.catName;
    data['catid'] = this.catid;
    data['caturl'] = this.caturl;
    if (this.subCat != null) {
      data['SubCat'] = this.subCat!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubCat {
  String? subcate;
  String? subcatid;

  SubCat({this.subcate, this.subcatid});

  SubCat.fromJson(Map<String, dynamic> json) {
    subcate = json['subcate'];
    subcatid = json['subcatid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subcate'] = this.subcate;
    data['subcatid'] = this.subcatid;
    return data;
  }
}
