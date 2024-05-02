// To parse this JSON data, do
//
//     final branchesModel = branchesModelFromJson(jsonString);

// ignore_for_file: constant_identifier_names, prefer_if_null_operators

import 'dart:convert';

BranchesModel branchesModelFromJson(String str) =>
    BranchesModel.fromJson(json.decode(str));

String branchesModelToJson(BranchesModel data) => json.encode(data.toJson());

class BranchesModel {
  bool? status;
  String? msg;
  List<Branches>? data;

  BranchesModel({
    this.status,
    this.msg,
    this.data,
  });

  factory BranchesModel.fromJson(Map<String, dynamic> json) => BranchesModel(
        status: json["status"],
        msg: json["msg"],
        data:
            List<Branches>.from(json["data"].map((x) => Branches.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Branches {
  int? id;
  Address? title;
  String? phone;
  int? isActive;
  String? image;
  String? lat;
  String? long;
  String? morningTimeFrom;
  String? morningTimeTo;
  String? eveningTimeFrom;
  String? eveningTimeTo;
  dynamic busyAt;
  String? busyHours;
  int? popupCategoryId;
  int? popupProductId;
  String? popupPhoto;
  int? showPopup;
  String? createdAt;
  String? updatedAt;
  String? instagram;
  String? twitter;
  Address? address;
  int? minTotalOrder;
  String? deliveryTimeFrom;
  String? deliveryTimeTo;
  String? code;
  String? taxNumber;
  int? companyId;
  String? qrImage;
  int? isWaitingList;
  int? waitingListNotifyCount;
  int? refId;
  String? statusEn;
  String? statusAr;
  int? statusNo;
  double? distance;
  int? inFavourite;
  double? rate;
  Address? popupCategoryTitle;
  List<BranchOrderMethod>? branchOrderMethod;
  Company? company;

  Branches({
    this.id,
    this.title,
    this.phone,
    this.isActive,
    this.image,
    this.lat,
    this.long,
    this.morningTimeFrom,
    this.morningTimeTo,
    this.eveningTimeFrom,
    this.eveningTimeTo,
    this.busyAt,
    this.busyHours,
    this.popupCategoryId,
    this.popupProductId,
    this.popupPhoto,
    this.showPopup,
    this.createdAt,
    this.updatedAt,
    this.instagram,
    this.twitter,
    this.address,
    this.minTotalOrder,
    this.deliveryTimeFrom,
    this.deliveryTimeTo,
    this.code,
    this.taxNumber,
    this.companyId,
    this.qrImage,
    this.isWaitingList,
    this.waitingListNotifyCount,
    this.refId,
    this.statusEn,
    this.statusAr,
    this.statusNo,
    this.distance,
    this.inFavourite,
    this.rate,
    this.popupCategoryTitle,
    this.branchOrderMethod,
    this.company,
  });

  factory Branches.fromJson(Map<String, dynamic> json) => Branches(
        id: json["id"],
        title: Address.fromJson(json["title"]),
        phone: json["phone"],
        isActive: json["is_active"],
        image: json["image"],
        lat: json["lat"],
        long: json["long"],
        morningTimeFrom: json["morning_time_from"],
        morningTimeTo: json["morning_time_to"],
        eveningTimeFrom: json["evening_time_from"],
        eveningTimeTo: json["evening_time_to"],
        busyAt: json["busy_at"],
        busyHours: json["busy_hours"],
        popupCategoryId: json["popup_category_id"],
        popupProductId: json["popup_product_id"],
        popupPhoto: json["popup_photo"],
        showPopup: json["show_popup"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        instagram: json["instagram"] == null ? null : json["instagram"],
        twitter: json["twitter"] == null ? null : json["twitter"],
        address: Address.fromJson(json["address"]),
        minTotalOrder: json["min_total_order"],
        deliveryTimeFrom: json["delivery_time_from"],
        deliveryTimeTo: json["delivery_time_to"],
        code: json["code"],
        taxNumber: json["tax_number"],
        companyId: json["company_id"],
        qrImage: json["qr_image"],
        isWaitingList: json["is_waiting_list"],
        waitingListNotifyCount: json["waiting_list_notify_count"],
        refId: json["ref_id"],
        statusEn: json["status_en"],
        statusAr: json["status_ar"] == null ? null : json["status_ar"],
        statusNo: json["status_no"],
        distance: json["distance"]?.toDouble(),
        inFavourite: json["in_favourite"],
        rate: json["rate"]?.toDouble(),
        popupCategoryTitle: json["popup_category_title"] == null
            ? null
            : Address.fromJson(json["popup_category_title"]),
        branchOrderMethod: List<BranchOrderMethod>.from(
            json["branch_order_method"]
                .map((x) => BranchOrderMethod.fromJson(x))),
        company: Company.fromJson(json["company"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title!.toJson(),
        "phone": phone,
        "is_active": isActive,
        "image": image,
        "lat": lat,
        "long": long,
        "morning_time_from": morningTimeFrom,
        "morning_time_to": morningTimeTo,
        "evening_time_from": eveningTimeFrom,
        "evening_time_to": eveningTimeTo,
        "busy_at": busyAt,
        "busy_hours": busyHours,
        "popup_category_id": popupCategoryId,
        "popup_product_id": popupProductId,
        "popup_photo": popupPhoto,
        "show_popup": showPopup,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "instagram": instagram,
        "twitter": twitter,
        "address": address!.toJson(),
        "min_total_order": minTotalOrder,
        "delivery_time_from": deliveryTimeFrom,
        "delivery_time_to": deliveryTimeTo,
        "code": code,
        "tax_number": taxNumber,
        "company_id": companyId,
        "qr_image": qrImage,
        "is_waiting_list": isWaitingList,
        "waiting_list_notify_count": waitingListNotifyCount,
        "ref_id": refId,
        "status_en": statusEn,
        "status_ar": statusAr,
        "status_no": statusNo,
        "distance": distance,
        "in_favourite": inFavourite,
        "rate": rate,
        "popup_category_title": popupCategoryTitle?.toJson(),
        "branch_order_method":
            List<dynamic>.from(branchOrderMethod!.map((x) => x.toJson())),
        "company": company!.toJson(),
      };
}

class Address {
  String? en;
  String? ar;

  Address({
    this.en,
    this.ar,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        en: json["en"],
        ar: json["ar"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "ar": ar,
      };
}

class BranchOrderMethod {
  int? id;
  Address? title;
  int? isActive;
  String? image;
  String? createdAt;
  Pivot? pivot;

  BranchOrderMethod({
    this.id,
    this.title,
    this.isActive,
    this.image,
    this.createdAt,
    this.pivot,
  });

  factory BranchOrderMethod.fromJson(Map<String, dynamic> json) =>
      BranchOrderMethod(
        id: json["id"],
        title: Address.fromJson(json["title"]),
        isActive: json["is_active"],
        image: json["image"],
        createdAt: json["created_at"]!,
        pivot: Pivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title!.toJson(),
        "is_active": isActive,
        "image": image,
        "created_at": createdAt,
        "pivot": pivot!.toJson(),
      };
}

class Pivot {
  int? branchId;
  int? orderMethodId;

  Pivot({
    this.branchId,
    this.orderMethodId,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        branchId: json["branch_id"],
        orderMethodId: json["order_method_id"],
      );

  Map<String, dynamic> toJson() => {
        "branch_id": branchId,
        "order_method_id": orderMethodId,
      };
}

class Company {
  int? id;
  Address? title;
  String? phone;
  int? isActive;
  String? image;
  String? createdAt;
  String? updatedAt;
  Address? about;
  Address? termsConditions;
  String? email;

  Company({
    this.id,
    this.title,
    this.phone,
    this.isActive,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.about,
    this.termsConditions,
    this.email,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["id"],
        title: Address.fromJson(json["title"]),
        phone: json["phone"],
        isActive: json["is_active"],
        image: json["image"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        about: Address.fromJson(json["about"]),
        termsConditions: Address.fromJson(json["terms_conditions"]),
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title!.toJson(),
        "phone": phone,
        "is_active": isActive,
        "image": image,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "about": about!.toJson(),
        "terms_conditions": termsConditions!.toJson(),
        "email": email,
      };
}
