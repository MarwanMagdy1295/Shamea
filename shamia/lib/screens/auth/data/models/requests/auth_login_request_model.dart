class AuthLoginRequestModel {
  AuthLoginRequestModel({
    this.phoneNumber,
    this.password,
    this.companyId = 3,
  });

  final String? phoneNumber;
  final String? password;
  final int? companyId;

  factory AuthLoginRequestModel.fromJson(Map<String, dynamic> json) =>
      AuthLoginRequestModel(
        phoneNumber: json["phone"],
        password: json["password"],
        companyId: json["company_id"],
      );

  Map<String, dynamic> toJson() => {
        "phone": phoneNumber,
        "password": password,
        "company_id": companyId,
      };
}
