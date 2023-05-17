class ListingDetailModel {
  bool? listingDetailsStatus;
  ListingDetails? listingDetails;
  List<BusinessImages>? businessImages;
  User? user;

  ListingDetailModel(
      {this.listingDetailsStatus,
        this.listingDetails,
        this.businessImages,
        this.user});

  ListingDetailModel.fromJson(Map<String, dynamic> json) {
    listingDetailsStatus = json['listingdetailsStatus'];
    listingDetails = json['listingDetails'] != null
        ? new ListingDetails.fromJson(json['listingDetails'])
        : null;
    if (json['businessImages'] != null) {
      businessImages = <BusinessImages>[];
      json['businessImages'].forEach((v) {
        businessImages!.add(new BusinessImages.fromJson(v));
      });
    }
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['listingdetailsStatus'] = this.listingDetailsStatus;
    if (this.listingDetails != null) {
      data['listingDetails'] = this.listingDetails!.toJson();
    }
    if (this.businessImages != null) {
      data['businessImages'] =
          this.businessImages!.map((v) => v.toJson()).toList();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class ListingDetails {
  String? businessID;
  String? businessHeading;
  String? businessLocation;
  String? businessPrice;
  String? salesRevenue;
  String? netProfit;
  String? furnitureValue;
  String? inventoryValue;
  String? businessCategory;
  String? businessDescription;
  String? movedS3;
  String? advertiserLogo;
  String? advertiserLink;
  String? refNumber;
  String? numericPrice;
  String? advertiserName;
  Null? agentName;

  ListingDetails(
      {this.businessID,
        this.businessHeading,
        this.businessLocation,
        this.businessPrice,
        this.salesRevenue,
        this.netProfit,
        this.furnitureValue,
        this.inventoryValue,
        this.businessCategory,
        this.businessDescription,
        this.movedS3,
        this.advertiserLogo,
        this.advertiserLink,
        this.refNumber,
        this.numericPrice,
        this.advertiserName,
        this.agentName});

  ListingDetails.fromJson(Map<String, dynamic> json) {
    businessID = json['businessID'];
    businessHeading = json['businessHeading'];
    businessLocation = json['businessLocation'];
    businessPrice = json['businessPrice'];
    salesRevenue = json['salesRevenue'];
    netProfit = json['netProfit'];
    furnitureValue = json['furnitureValue'];
    inventoryValue = json['inventoryValue'];
    businessCategory = json['businessCategory'];
    businessDescription = json['businessDescription'];
    movedS3 = json['moved_s3'];
    advertiserLogo = json['advertiserLogo'];
    advertiserLink = json['advertiserLink'];
    refNumber = json['refNumber'];
    numericPrice = json['numericPrice'];
    advertiserName = json['advertiserName'];
    agentName = json['agentName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['businessID'] = this.businessID;
    data['businessHeading'] = this.businessHeading;
    data['businessLocation'] = this.businessLocation;
    data['businessPrice'] = this.businessPrice;
    data['salesRevenue'] = this.salesRevenue;
    data['netProfit'] = this.netProfit;
    data['furnitureValue'] = this.furnitureValue;
    data['inventoryValue'] = this.inventoryValue;
    data['businessCategory'] = this.businessCategory;
    data['businessDescription'] = this.businessDescription;
    data['moved_s3'] = this.movedS3;
    data['advertiserLogo'] = this.advertiserLogo;
    data['advertiserLink'] = this.advertiserLink;
    data['refNumber'] = this.refNumber;
    data['numericPrice'] = this.numericPrice;
    data['advertiserName'] = this.advertiserName;
    data['agentName'] = this.agentName;
    return data;
  }
}

class BusinessImages {
  String? orderID;
  String? smallImage;
  String? image;
  String? lrgImage;

  BusinessImages({this.orderID, this.smallImage, this.image, this.lrgImage});

  BusinessImages.fromJson(Map<String, dynamic> json) {
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

class User {
  int? id;
  String? companyName;
  String? name;
  String? email;
  String? phone;
  String? street;
  String? suburb;
  String? city;
  String? state;
  String? postcode;
  String? mobile;
  String? username;
  String? password;
  String? logo;
  String? logoOpt;
  String? type;
  String? countryId;
  String? added;
  String? brokerWebsite;
  String? networks;
  String? xmluploads;
  String? xmluploadFolder;
  String? joined;
  String? status;
  String? phoneClicks;
  String? pcClicks;
  String? totalEnquiries;
  String? lastloggedin;
  String? viewed;
  String? sentEmailStatus;
  String? newsletter;
  String? xmlRss;
  String? xmlFormatedRss;
  String? ipaddress;
  String? countryip;
  String? reaXmlVersion;
  String? brokerUrl;
  String? brokerListingUrl;
  String? verification;
  String? brokerAgentUrl;
  String? sunbeltUrl;
  String? sunbeltOfficeId;
  String? twitter;
  String? facebook;
  String? googleplus;
  String? linkedinn;
  String? youtube;
  String? articleRss;
  String? ewayToken;
  String? totalListings;
  String? addedListings;
  String? featured;
  String? priority;
  String? isF2s;
  String? mannualAuto;
  String? ribbonStatus;

  User(
      {this.id,
        this.companyName,
        this.name,
        this.email,
        this.phone,
        this.street,
        this.suburb,
        this.city,
        this.state,
        this.postcode,
        this.mobile,
        this.username,
        this.password,
        this.logo,
        this.logoOpt,
        this.type,
        this.countryId,
        this.added,
        this.brokerWebsite,
        this.networks,
        this.xmluploads,
        this.xmluploadFolder,
        this.joined,
        this.status,
        this.phoneClicks,
        this.pcClicks,
        this.totalEnquiries,
        this.lastloggedin,
        this.viewed,
        this.sentEmailStatus,
        this.newsletter,
        this.xmlRss,
        this.xmlFormatedRss,
        this.ipaddress,
        this.countryip,
        this.reaXmlVersion,
        this.brokerUrl,
        this.brokerListingUrl,
        this.verification,
        this.brokerAgentUrl,
        this.sunbeltUrl,
        this.sunbeltOfficeId,
        this.twitter,
        this.facebook,
        this.googleplus,
        this.linkedinn,
        this.youtube,
        this.articleRss,
        this.ewayToken,
        this.totalListings,
        this.addedListings,
        this.featured,
        this.priority,
        this.isF2s,
        this.mannualAuto,
        this.ribbonStatus});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyName = json['company_name'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    street = json['street'];
    suburb = json['suburb'];
    city = json['city'];
    state = json['state'];
    postcode = json['postcode'];
    mobile = json['mobile'];
    username = json['username'];
    password = json['password'];
    logo = json['logo'];
    logoOpt = json['logo_opt'];
    type = json['type'];
    countryId = json['country_id'];
    added = json['added'];
    brokerWebsite = json['broker_website'];
    networks = json['networks'];
    xmluploads = json['xmluploads'];
    xmluploadFolder = json['xmlupload_folder'];
    joined = json['joined'];
    status = json['status'];
    phoneClicks = json['phone_clicks'];
    pcClicks = json['pc_clicks'];
    totalEnquiries = json['total_enquiries'];
    lastloggedin = json['lastloggedin'];
    viewed = json['viewed'];
    sentEmailStatus = json['sent_email_status'];
    newsletter = json['newsletter'];
    xmlRss = json['xml_rss'];
    xmlFormatedRss = json['xml_formated_rss'];
    ipaddress = json['ipaddress'];
    countryip = json['countryip'];
    reaXmlVersion = json['rea_xml_version'];
    brokerUrl = json['broker_url'];
    brokerListingUrl = json['broker_listing_url'];
    verification = json['verification'];
    brokerAgentUrl = json['broker_agent_url'];
    sunbeltUrl = json['sunbelt_url'];
    sunbeltOfficeId = json['sunbelt_office_id'];
    twitter = json['twitter'];
    facebook = json['facebook'];
    googleplus = json['googleplus'];
    linkedinn = json['linkedinn'];
    youtube = json['youtube'];
    articleRss = json['article_rss'];
    ewayToken = json['eway_token'];
    totalListings = json['total_listings'];
    addedListings = json['added_listings'];
    featured = json['featured'];
    priority = json['priority'];
    isF2s = json['is_f2s'];
    mannualAuto = json['mannual_auto'];
    ribbonStatus = json['ribbon_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['company_name'] = this.companyName;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['street'] = this.street;
    data['suburb'] = this.suburb;
    data['city'] = this.city;
    data['state'] = this.state;
    data['postcode'] = this.postcode;
    data['mobile'] = this.mobile;
    data['username'] = this.username;
    data['password'] = this.password;
    data['logo'] = this.logo;
    data['logo_opt'] = this.logoOpt;
    data['type'] = this.type;
    data['country_id'] = this.countryId;
    data['added'] = this.added;
    data['broker_website'] = this.brokerWebsite;
    data['networks'] = this.networks;
    data['xmluploads'] = this.xmluploads;
    data['xmlupload_folder'] = this.xmluploadFolder;
    data['joined'] = this.joined;
    data['status'] = this.status;
    data['phone_clicks'] = this.phoneClicks;
    data['pc_clicks'] = this.pcClicks;
    data['total_enquiries'] = this.totalEnquiries;
    data['lastloggedin'] = this.lastloggedin;
    data['viewed'] = this.viewed;
    data['sent_email_status'] = this.sentEmailStatus;
    data['newsletter'] = this.newsletter;
    data['xml_rss'] = this.xmlRss;
    data['xml_formated_rss'] = this.xmlFormatedRss;
    data['ipaddress'] = this.ipaddress;
    data['countryip'] = this.countryip;
    data['rea_xml_version'] = this.reaXmlVersion;
    data['broker_url'] = this.brokerUrl;
    data['broker_listing_url'] = this.brokerListingUrl;
    data['verification'] = this.verification;
    data['broker_agent_url'] = this.brokerAgentUrl;
    data['sunbelt_url'] = this.sunbeltUrl;
    data['sunbelt_office_id'] = this.sunbeltOfficeId;
    data['twitter'] = this.twitter;
    data['facebook'] = this.facebook;
    data['googleplus'] = this.googleplus;
    data['linkedinn'] = this.linkedinn;
    data['youtube'] = this.youtube;
    data['article_rss'] = this.articleRss;
    data['eway_token'] = this.ewayToken;
    data['total_listings'] = this.totalListings;
    data['added_listings'] = this.addedListings;
    data['featured'] = this.featured;
    data['priority'] = this.priority;
    data['is_f2s'] = this.isF2s;
    data['mannual_auto'] = this.mannualAuto;
    data['ribbon_status'] = this.ribbonStatus;
    return data;
  }
}
