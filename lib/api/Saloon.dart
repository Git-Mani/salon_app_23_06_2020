// To parse this JSON data, do
//
//     final saloon = saloonFromJson(jsonString);

import 'dart:convert';

Saloon saloonFromJson(String str) => Saloon.fromJson(json.decode(str));

String saloonToJson(Saloon data) => json.encode(data.toJson());

class Saloon {
  Saloon({
    this.salons,
  });

  List<Salon> salons;

  factory Saloon.fromJson(Map<String, dynamic> json) => Saloon(
        salons: List<Salon>.from(json["salons"].map((x) => Salon.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "salons": List<dynamic>.from(salons.map((x) => x.toJson())),
      };
}

class Salon {
  Salon({
    this.id,
    this.brandId,
    this.salonName,
    this.salonType,
    this.salonCategory,
    this.isOpen,
    this.capicity,
    this.openingTime,
    this.closingTime,
    this.scheduleOffFrom,
    this.scheduleOffTo,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.serviceMappings,
    this.file,
    this.rating,
  });

  int id;
  int brandId;
  String salonName;
  SalonCategory salonType;
  SalonCategory salonCategory;
  int isOpen;
  int capicity;
  String openingTime;
  String closingTime;
  dynamic scheduleOffFrom;
  dynamic scheduleOffTo;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  List<ServiceMapping> serviceMappings;
  List<FileElement> file;
  List<Rating> rating;

  factory Salon.fromJson(Map<String, dynamic> json) => Salon(
        id: json["id"],
        brandId: json["brand_id"],
        salonName: json["salon_name"],
        salonType: SalonCategory.fromJson(json["salon_type"]),
        salonCategory: SalonCategory.fromJson(json["salon_category"]),
        isOpen: json["is_open"],
        capicity: json["capicity"],
        openingTime: json["opening_time"],
        closingTime: json["closing_time"],
        scheduleOffFrom: json["schedule_off_from"],
        scheduleOffTo: json["schedule_off_to"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        serviceMappings: List<ServiceMapping>.from(
            json["service_mappings"].map((x) => ServiceMapping.fromJson(x))),
        file: List<FileElement>.from(
            json["file"].map((x) => FileElement.fromJson(x))),
        rating:
            List<Rating>.from(json["rating"].map((x) => Rating.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "brand_id": brandId,
        "salon_name": salonName,
        "salon_type": salonType.toJson(),
        "salon_category": salonCategory.toJson(),
        "is_open": isOpen,
        "capicity": capicity,
        "opening_time": openingTime,
        "closing_time": closingTime,
        "schedule_off_from": scheduleOffFrom,
        "schedule_off_to": scheduleOffTo,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "service_mappings":
            List<dynamic>.from(serviceMappings.map((x) => x.toJson())),
        "file": List<dynamic>.from(file.map((x) => x.toJson())),
        "rating": List<dynamic>.from(rating.map((x) => x.toJson())),
      };
}

class FileElement {
  FileElement({
    this.id,
    this.salonId,
    this.imageName,
    this.imageLink,
    this.imagePath,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  int salonId;
  dynamic imageName;
  String imageLink;
  dynamic imagePath;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory FileElement.fromJson(Map<String, dynamic> json) => FileElement(
        id: json["id"],
        salonId: json["salon_id"],
        imageName: json["image_name"],
        imageLink: json["image_link"],
        imagePath: json["image_path"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "salon_id": salonId,
        "image_name": imageName,
        "image_link": imageLink,
        "image_path": imagePath,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
      };
}

class Rating {
  Rating({
    this.id,
    this.rating,
    this.userId,
    this.salonId,
    this.comment,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  int rating;
  int userId;
  int salonId;
  String comment;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        id: json["id"],
        rating: json["rating"],
        userId: json["user_id"],
        salonId: json["salon_id"],
        comment: json["comment"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rating": rating,
        "user_id": userId,
        "salon_id": salonId,
        "comment": comment,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
      };
}

class SalonCategory {
  SalonCategory({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.duration,
  });

  int id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  int duration;

  factory SalonCategory.fromJson(Map<String, dynamic> json) => SalonCategory(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        duration: json["duration"] == null ? null : json["duration"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "duration": duration == null ? null : duration,
      };
}

class ServiceMapping {
  ServiceMapping({
    this.id,
    this.salonId,
    this.serviceId,
    this.price,
    this.category,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.serviceName,
  });

  int id;
  int salonId;
  int serviceId;
  int price;
  Category category;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  SalonCategory serviceName;

  factory ServiceMapping.fromJson(Map<String, dynamic> json) => ServiceMapping(
        id: json["id"],
        salonId: json["salon_id"],
        serviceId: json["service_id"],
        price: json["price"],
        category: categoryValues.map[json["category"]],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        serviceName: SalonCategory.fromJson(json["service_name"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "salon_id": salonId,
        "service_id": serviceId,
        "price": price,
        "category": categoryValues.reverse[category],
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "service_name": serviceName.toJson(),
      };
}

enum Category { MEN }

final categoryValues = EnumValues({"Men": Category.MEN});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
