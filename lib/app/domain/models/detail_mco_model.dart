import 'dart:convert';

DetailMco detailMcoFromJson(String str) => DetailMco.fromJson(json.decode(str));

String detailMcoToJson(DetailMco data) => json.encode(data.toJson());

class DetailMco {
  DetailMco({
    required this.id,
    required this.title,
    required this.price,
    required this.soldQuantity,
    required this.picture,
    required this.shipping,
    required this.freeShipping,
    required this.status,
    required this.sku,
    required this.dbExists,
  });

  final String id;
  final String title;
  final int price;
  final int soldQuantity;
  final String picture;
  final String shipping;
  final bool freeShipping;
  final String status;
  final String sku;
  final bool dbExists;

  factory DetailMco.fromJson(Map<String, dynamic> json) => DetailMco(
        id: json["id"] ?? '',
        title: json["title"] ?? '',
        price: json["price"] ?? 0,
        soldQuantity: json["sold_quantity"] ?? 0,
        picture: json["picture"] ?? '',
        shipping: json["shipping"] ?? '',
        freeShipping: json["free_shipping"] ?? true,
        status: json["status"] ?? '',
        sku: json["sku"] ?? '',
        dbExists: json["db_exists"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "sold_quantity": soldQuantity,
        "picture": picture,
        "shipping": shipping,
        "free_shipping": freeShipping,
        "status": status,
        "sku": sku,
        "db_exists": dbExists,
      };
}
