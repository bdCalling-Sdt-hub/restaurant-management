class TableBookModel {
  bool? success;
  String? message;
  Data? data;

  TableBookModel({this.success, this.message, this.data});

  TableBookModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? name;
  String? location;
  String? description;
  String? status;
  List<Images>? images;
  Close? close;
  bool? reviewStatus;
  int? avgReviews;
  List<Days>? days;

  Data(
      {this.sId,
        this.name,
        this.location,
        this.description,
        this.status,
        this.images,
        this.close,
        this.reviewStatus,
        this.avgReviews,
        this.days});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    location = json['location'];
    description = json['description'];
    status = json['status'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    close = json['close'] != null ? new Close.fromJson(json['close']) : null;
    reviewStatus = json['reviewStatus'];
    avgReviews = json['avgReviews'];
    if (json['days'] != null) {
      days = <Days>[];
      json['days'].forEach((v) {
        days!.add(new Days.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['location'] = this.location;
    data['description'] = this.description;
    data['status'] = this.status;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    if (this.close != null) {
      data['close'] = this.close!.toJson();
    }
    data['reviewStatus'] = this.reviewStatus;
    data['avgReviews'] = this.avgReviews;
    if (this.days != null) {
      data['days'] = this.days!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  String? url;
  String? sId;

  Images({this.url, this.sId});

  Images.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['_id'] = this.sId;
    return data;
  }
}

class Close {
  String? from;
  String? to;

  Close({this.from, this.to});

  Close.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['from'] = this.from;
    data['to'] = this.to;
    return data;
  }
}

class Days {
  String? day;
  String? openingTime;
  String? closingTime;

  Days({this.day, this.openingTime, this.closingTime});

  Days.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    openingTime = json['openingTime'];
    closingTime = json['closingTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['openingTime'] = this.openingTime;
    data['closingTime'] = this.closingTime;
    return data;
  }
}
