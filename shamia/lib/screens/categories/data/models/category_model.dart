// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  bool status;
  String msg;
  List<Category>? data;

  CategoryModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        status: json["status"],
        msg: json["msg"],
        data:
            List<Category>.from(json["data"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Category {
  int? id;
  Title? title;
  int? isActive;
  String? image;
  int? order;
  String? createdAt;
  dynamic updatedAt;
  int? companyId;
  int? refId;
  bool? isSelected;

  Category({
    this.id,
    this.title,
    this.isActive,
    this.image,
    this.order,
    this.createdAt,
    this.updatedAt,
    this.companyId,
    this.refId,
    this.isSelected = false,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        title: Title.fromJson(json["title"]),
        isActive: json["is_active"],
        image: json["image"] == null ? null : json["image"],
        order: json["order"] == null ? null : json["order"],
        createdAt: json['created_at'] != null ? json["created_at"] : null,
        updatedAt: json["updated_at"] == null ? null : json["updated_at"],
        companyId: json["company_id"] == null ? null : json["company_id"],
        refId: json["ref_id"] == null ? null : json["ref_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title!.toJson(),
        "is_active": isActive,
        "image": image,
        "order": order,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "company_id": companyId,
        "ref_id": refId,
      };
}

class Title {
  String? en;
  String? ar;

  Title({
    required this.en,
    required this.ar,
  });

  factory Title.fromJson(Map<String, dynamic> json) => Title(
        en: json["en"] == null ? null : json["en"],
        ar: json["ar"] == null ? null : json["ar"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "ar": ar,
      };
}
