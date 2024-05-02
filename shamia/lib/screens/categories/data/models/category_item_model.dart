// To parse this JSON data, do
//
//     final categoryItemModel = categoryItemModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

CategoryItemModel categoryItemModelFromJson(String str) =>
    CategoryItemModel.fromJson(json.decode(str));

String categoryItemModelToJson(CategoryItemModel data) =>
    json.encode(data.toJson());

class CategoryItemModel {
  bool? status;
  String? msg;
  CategoryItemInfo? data;

  CategoryItemModel({
    this.status,
    this.msg,
    this.data,
  });

  factory CategoryItemModel.fromJson(Map<String, dynamic> json) =>
      CategoryItemModel(
        status: json["status"] == null ? null : json["status"],
        msg: json["msg"],
        data: json["data"] == null
            ? null
            : CategoryItemInfo.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data!.toJson(),
      };
}

class CategoryItemInfo {
  int? currentPage;
  List<CategoryItem>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Link>? links;
  String? nextPageUrl;
  String? path;
  String? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  CategoryItemInfo({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory CategoryItemInfo.fromJson(Map<String, dynamic> json) =>
      CategoryItemInfo(
        currentPage: json["current_page"] == null ? null : json["current_page"],
        data: List<CategoryItem>.from(
            json["data"].map((x) => CategoryItem.fromJson(x))),
        firstPageUrl:
            json["first_page_url"] == null ? null : json["first_page_url"],
        from: json["from"] == null ? null : json["from"],
        lastPage: json["last_page"] == null ? null : json["last_page"],
        lastPageUrl:
            json["last_page_url"] == null ? null : json["last_page_url"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl:
            json["next_page_url"] == null ? null : json["next_page_url"],
        path: json["path"] == null ? null : json["path"],
        perPage: json["per_page"] == null ? null : json["per_page"],
        prevPageUrl:
            json["prev_page_url"] == null ? null : json["prev_page_url"],
        to: json["to"] == null ? null : json["to"],
        total: json["total"] == null ? null : json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": List<dynamic>.from(links!.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class CategoryItem {
  int? id;
  Description? title;
  Description? description;
  Sensitive? sensitive;
  String? calories;
  int? price;
  int? newPrice;
  int? isActive;
  int? isSlider;
  int? isMorning;
  int? isEvening;
  int? indexnum;
  int? recommend;
  int? denyCoupon;
  int? categoryId;
  String? createdAt;
  String? updatedAt;
  String? sliderImage;
  int? maxQuantity;
  int? limitClientCount;
  int? departmentId;
  int? unitId;
  int? customerPrice;
  String? itemCode;
  String? itemName;
  int? inPos;
  int? inMobile;
  int? companyId;
  int? refId;
  int? attributesCount;
  int? inFavourite;
  Image? lastImage;
  int? clientCurrentCount;
  String? titleMix;
  List<Image>? images;
  Pivot? pivot;

  CategoryItem({
    this.id,
    this.title,
    this.description,
    this.sensitive,
    this.calories,
    this.price,
    this.newPrice,
    this.isActive,
    this.isSlider,
    this.isMorning,
    this.isEvening,
    this.indexnum,
    this.recommend,
    this.denyCoupon,
    this.categoryId,
    this.createdAt,
    this.updatedAt,
    this.sliderImage,
    this.maxQuantity,
    this.limitClientCount,
    this.departmentId,
    this.unitId,
    this.customerPrice,
    this.itemCode,
    this.itemName,
    this.inPos,
    this.inMobile,
    this.companyId,
    this.refId,
    this.attributesCount,
    this.inFavourite,
    this.lastImage,
    this.clientCurrentCount,
    this.titleMix,
    this.images,
    this.pivot,
  });

  factory CategoryItem.fromJson(Map<String, dynamic> json) => CategoryItem(
        id: json["id"],
        title: Description.fromJson(json["title"]),
        description: Description.fromJson(json["description"]),
        sensitive: Sensitive.fromJson(json["sensitive"]),
        calories: json["calories"] == null ? null : json["calories"],
        price: json["price"] == null ? null : json["price"],
        newPrice: json["new_price"] == null ? null : json["new_price"],
        isActive: json["is_active"] == null ? null : json["is_active"],
        isSlider: json["is_slider"] == null ? null : json["is_slider"],
        isMorning: json["is_morning"] == null ? null : json["is_morning"],
        isEvening: json["is_evening"] == null ? null : json["is_evening"],
        indexnum: json["indexnum"] == null ? null : json["indexnum"],
        recommend: json["recommend"] == null ? null : json["recommend"],
        denyCoupon: json["deny_coupon"] == null ? null : json["deny_coupon"],
        categoryId: json["category_id"] == null ? null : json["category_id"],
        createdAt: json["created_at"] == null ? null : json["created_at"],
        updatedAt: json["updated_at"] == null ? null : json["updated_at"],
        sliderImage: json["slider_image"] == null ? null : json["slider_image"],
        maxQuantity: json["max_quantity"] == null ? null : json["max_quantity"],
        limitClientCount: json["limit_client_count"] == null
            ? null
            : json["limit_client_count"],
        departmentId:
            json["department_id"] == null ? null : json["department_id"],
        unitId: json["unit_id"] == null ? null : json["unit_id"],
        customerPrice:
            json["customer_price"] == null ? null : json["customer_price"],
        itemCode: json["item_code"] == null ? null : json["item_code"],
        itemName: json["item_name"] == null ? null : json["item_name"],
        inPos: json["in_pos"] == null ? null : json["in_pos"],
        inMobile: json["in_mobile"] == null ? null : json["in_mobile"],
        companyId: json["company_id"] == null ? null : json["company_id"],
        refId: json["ref_id"] == null ? null : json["ref_id"],
        attributesCount:
            json["attributes_count"] == null ? null : json["attributes_count"],
        inFavourite:
            json["in_favourite"] == null ? null : json["next_page_url"],
        lastImage: Image.fromJson(json["last_image"]),
        clientCurrentCount: json["client_current_count"] == null
            ? null
            : json["client_current_count"],
        titleMix: json["title_mix"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        pivot: Pivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title!.toJson(),
        "description": description!.toJson(),
        "sensitive": sensitive!.toJson(),
        "calories": calories,
        "price": price,
        "new_price": newPrice,
        "is_active": isActive,
        "is_slider": isSlider,
        "is_morning": isMorning,
        "is_evening": isEvening,
        "indexnum": indexnum,
        "recommend": recommend,
        "deny_coupon": denyCoupon,
        "category_id": categoryId,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "slider_image": sliderImage,
        "max_quantity": maxQuantity,
        "limit_client_count": limitClientCount,
        "department_id": departmentId,
        "unit_id": unitId,
        "customer_price": customerPrice,
        "item_code": itemCode,
        "item_name": itemName,
        "in_pos": inPos,
        "in_mobile": inMobile,
        "company_id": companyId,
        "ref_id": refId,
        "attributes_count": attributesCount,
        "in_favourite": inFavourite,
        "last_image": lastImage!.toJson(),
        "client_current_count": clientCurrentCount,
        "title_mix": titleMix,
        "images": List<dynamic>.from(images!.map((x) => x.toJson())),
        "pivot": pivot!.toJson(),
      };
}

class Description {
  String? en;
  String? ar;

  Description({
    this.en,
    this.ar,
  });

  factory Description.fromJson(Map<String, dynamic> json) => Description(
        en: json["en"] == null ? null : json["en"],
        ar: json["ar"] == null ? null : json["ar"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "ar": ar,
      };
}

class Image {
  int? id;
  String? image;

  Image({
    required this.id,
    required this.image,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
      };
}

class Pivot {
  int branchId;
  int productId;
  int adminId;
  int isActive;
  dynamic busyAt;
  String? busyHours;

  Pivot({
    required this.branchId,
    required this.productId,
    required this.adminId,
    required this.isActive,
    required this.busyAt,
    required this.busyHours,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        branchId: json["branch_id"],
        productId: json["product_id"],
        adminId: json["admin_id"],
        isActive: json["is_active"],
        busyAt: json["busy_at"],
        busyHours: json["busy_hours"],
      );

  Map<String, dynamic> toJson() => {
        "branch_id": branchId,
        "product_id": productId,
        "admin_id": adminId,
        "is_active": isActive,
        "busy_at": busyAt,
        "busy_hours": busyHours,
      };
}

class Sensitive {
  String? ar;

  Sensitive({
    this.ar,
  });

  factory Sensitive.fromJson(Map<String, dynamic> json) => Sensitive(
        ar: json["ar"] == null ? null : json["ar"],
      );

  Map<String, dynamic> toJson() => {
        "ar": ar,
      };
}

class Link {
  String? url;
  String label;
  bool active;

  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}
