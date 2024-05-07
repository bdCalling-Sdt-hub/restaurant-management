class AllFavouriteModel {
  bool? success;
  String? message;
  List<Data>? data;
  Meta? meta;

  AllFavouriteModel({this.success, this.message, this.data, this.meta});

  AllFavouriteModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class Data {
  String? sId;
  List<Menu>? menu;

  Data({this.sId, this.menu});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    if (json['menu'] != null) {
      menu = <Menu>[];
      json['menu'].forEach((v) {
        menu!.add(new Menu.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.menu != null) {
      data['menu'] = this.menu!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Menu {
  String? sId;
  String? category;
  String? image;
  String? restaurant;
  String? description;
  String? name;
  int? price;
  String? owner;
  bool? available;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Menu(
      {this.sId,
        this.category,
        this.image,
        this.restaurant,
        this.description,
        this.name,
        this.price,
        this.owner,
        this.available,
        this.isDeleted,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Menu.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    category = json['category'];
    image = json['image'];
    restaurant = json['restaurant'];
    description = json['description'];
    name = json['name'];
    price = json['price'];
    owner = json['owner'];
    available = json['available'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['category'] = this.category;
    data['image'] = this.image;
    data['restaurant'] = this.restaurant;
    data['description'] = this.description;
    data['name'] = this.name;
    data['price'] = this.price;
    data['owner'] = this.owner;
    data['available'] = this.available;
    data['isDeleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Meta {
  int? page;
  int? limit;
  int? total;
  int? totalPage;

  Meta({this.page, this.limit, this.total, this.totalPage});

  Meta.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    limit = json['limit'];
    total = json['total'];
    totalPage = json['totalPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['limit'] = this.limit;
    data['total'] = this.total;
    data['totalPage'] = this.totalPage;
    return data;
  }
}
