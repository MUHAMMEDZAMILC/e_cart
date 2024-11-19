// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    int? productId;
    String? name;
    String? description;
    dynamic price;
    String? afterdis;
    String? unit;
    String? image;
    dynamic discount;
    bool? availability;
    String? brand;
    String? category;
    dynamic rating;
    List<Review>? reviews;

    Product({
        this.productId,
        this.name,
        this.description,
        this.price,
        this.afterdis,
        this.unit,
        this.image,
        this.discount,
        this.availability,
        this.brand,
        this.category,
        this.rating,
        this.reviews,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["product_id"],
        name: json["name"],
        description: json["description"],
        price: json["price"]?.toDouble(),
        afterdis:double.parse((json["price"]?.toDouble() - ((json["price"]?.toDouble()*10)/100)).toString()).toStringAsFixed(2),
        unit: json["unit"],
        image: json["image"],
        discount: json["discount"],
        availability: json["availability"],
        brand: json["brand"],
        category: json["category"],
        rating: json["rating"]?.toDouble(),
        reviews: json["reviews"] == null ? [] : List<Review>.from(json["reviews"]!.map((x) => Review.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "product_id": productId,
        "name": name,
        "description": description,
        "price": price,
        "unit": unit,
        "image": image,
        "discount": discount,
        "availability": availability,
        "brand": brand,
        "category": category,
        "rating": rating,
        "reviews": reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x.toJson())),
    };
}

class Review {
    int? userId;
    int? rating;
    String? comment;

    Review({
        this.userId,
        this.rating,
        this.comment,
    });

    factory Review.fromJson(Map<String, dynamic> json) => Review(
        userId: json["user_id"],
        rating: json["rating"],
        comment: json["comment"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "rating": rating,
        "comment": comment,
    };
}
