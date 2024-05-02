class CardListModel {
  bool? success;
  String? message;
  Data? data;

  CardListModel({this.success, this.message, this.data});

  CardListModel.fromJson(Map<String, dynamic> json) {
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
  String? booking;
  int? iV;
  String? createdAt;
  String? date;
  int? discount;
  bool? isDeleted;
  List<Items>? items;
  bool? paid;
  int? subTotal;
  int? totalAmount;
  String? updatedAt;
  String? user;

  Data(
      {this.sId,
        this.booking,
        this.iV,
        this.createdAt,
        this.date,
        this.discount,
        this.isDeleted,
        this.items,
        this.paid,
        this.subTotal,
        this.totalAmount,
        this.updatedAt,
        this.user});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    booking = json['booking'];
    iV = json['__v'];
    createdAt = json['createdAt'];
    date = json['date'];
    discount = json['discount'];
    isDeleted = json['isDeleted'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    paid = json['paid'];
    subTotal = json['subTotal'];
    totalAmount = json['totalAmount'];
    updatedAt = json['updatedAt'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['booking'] = this.booking;
    data['__v'] = this.iV;
    data['createdAt'] = this.createdAt;
    data['date'] = this.date;
    data['discount'] = this.discount;
    data['isDeleted'] = this.isDeleted;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['paid'] = this.paid;
    data['subTotal'] = this.subTotal;
    data['totalAmount'] = this.totalAmount;
    data['updatedAt'] = this.updatedAt;
    data['user'] = this.user;
    return data;
  }
}

class Items {
  Menu? menu;
  int? quantity;
  int? amount;
  String? sId;

  Items({this.menu, this.quantity, this.amount, this.sId});

  Items.fromJson(Map<String, dynamic> json) {
    menu = json['menu'] != null ? new Menu.fromJson(json['menu']) : null;
    quantity = json['quantity'];
    amount = json['amount'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.menu != null) {
      data['menu'] = this.menu!.toJson();
    }
    data['quantity'] = this.quantity;
    data['amount'] = this.amount;
    data['_id'] = this.sId;
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
