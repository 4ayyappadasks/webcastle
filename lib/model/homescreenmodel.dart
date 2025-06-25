// To parse this JSON data, do
//
//     final homemodel = homemodelFromJson(jsonString);

import 'dart:convert';

Homemodel homemodelFromJson(String str) => Homemodel.fromJson(json.decode(str));

String homemodelToJson(Homemodel data) => json.encode(data.toJson());

class Homemodel {
  int errorCode;
  String message;
  Data data;

  Homemodel({
    required this.errorCode,
    required this.message,
    required this.data,
  });

  factory Homemodel.fromJson(Map<String, dynamic> json) => Homemodel(
    errorCode: json["error_code"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "error_code": errorCode,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  List<HomeField> homeFields;
  int notificationCount;

  Data({
    required this.homeFields,
    required this.notificationCount,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    homeFields: List<HomeField>.from(json["home_fields"].map((x) => HomeField.fromJson(x))),
    notificationCount: json["notification_count"],
  );

  Map<String, dynamic> toJson() => {
    "home_fields": List<dynamic>.from(homeFields.map((x) => x.toJson())),
    "notification_count": notificationCount,
  };
}

class HomeField {
  String type;
  List<Banner>? carouselItems;
  List<Brand>? brands;
  List<Brand>? categories;
  String? image;
  int? collectionId;
  String? name;
  List<Product>? products;
  List<Banner>? banners;
  Banner? banner;

  HomeField({
    required this.type,
    this.carouselItems,
    this.brands,
    this.categories,
    this.image,
    this.collectionId,
    this.name,
    this.products,
    this.banners,
    this.banner,
  });

  factory HomeField.fromJson(Map<String, dynamic> json) => HomeField(
    type: json["type"],
    carouselItems: json["carousel_items"] == null ? [] : List<Banner>.from(json["carousel_items"]!.map((x) => Banner.fromJson(x))),
    brands: json["brands"] == null ? [] : List<Brand>.from(json["brands"]!.map((x) => Brand.fromJson(x))),
    categories: json["categories"] == null ? [] : List<Brand>.from(json["categories"]!.map((x) => Brand.fromJson(x))),
    image: json["image"],
    collectionId: json["collection_id"],
    name: json["name"],
    products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
    banners: json["banners"] == null ? [] : List<Banner>.from(json["banners"]!.map((x) => Banner.fromJson(x))),
    banner: json["banner"] == null ? null : Banner.fromJson(json["banner"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "carousel_items": carouselItems == null ? [] : List<dynamic>.from(carouselItems!.map((x) => x.toJson())),
    "brands": brands == null ? [] : List<dynamic>.from(brands!.map((x) => x.toJson())),
    "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toJson())),
    "image": image,
    "collection_id": collectionId,
    "name": name,
    "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
    "banners": banners == null ? [] : List<dynamic>.from(banners!.map((x) => x.toJson())),
    "banner": banner?.toJson(),
  };
}

class Banner {
  int id;
  String image;
  String type;

  Banner({
    required this.id,
    required this.image,
    required this.type,
  });

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
    id: json["id"],
    image: json["image"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "type": type,
  };
}

class Brand {
  int id;
  String name;
  String image;

  Brand({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
    id: json["id"],
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
  };
}

class Product {
  int id;
  String image;
  String name;
  Currency currency;
  Unit unit;
  bool wishlisted;
  bool rfqStatus;
  int cartCount;
  int futureCartCount;
  bool hasStock;
  String price;
  String actualPrice;
  String offer;
  List<dynamic> offerPrices;

  Product({
    required this.id,
    required this.image,
    required this.name,
    required this.currency,
    required this.unit,
    required this.wishlisted,
    required this.rfqStatus,
    required this.cartCount,
    required this.futureCartCount,
    required this.hasStock,
    required this.price,
    required this.actualPrice,
    required this.offer,
    required this.offerPrices,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    image: json["image"],
    name: json["name"],
    currency: currencyValues.map[json["currency"]]!,
    unit: unitValues.map[json["unit"]]!,
    wishlisted: json["wishlisted"],
    rfqStatus: json["rfq_status"],
    cartCount: json["cart_count"],
    futureCartCount: json["future_cart_count"],
    hasStock: json["has_stock"],
    price: json["price"],
    actualPrice: json["actual_price"],
    offer: json["offer"],
    offerPrices: List<dynamic>.from(json["offer_prices"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "name": name,
    "currency": currencyValues.reverse[currency],
    "unit": unitValues.reverse[unit],
    "wishlisted": wishlisted,
    "rfq_status": rfqStatus,
    "cart_count": cartCount,
    "future_cart_count": futureCartCount,
    "has_stock": hasStock,
    "price": price,
    "actual_price": actualPrice,
    "offer": offer,
    "offer_prices": List<dynamic>.from(offerPrices.map((x) => x)),
  };
}

enum Currency {
  AED
}

final currencyValues = EnumValues({
  "AED": Currency.AED
});

enum Unit {
  PER_CARTON
}

final unitValues = EnumValues({
  "per Carton": Unit.PER_CARTON
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
