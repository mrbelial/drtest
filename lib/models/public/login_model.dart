class LoginModel {
  LoginModel({
    required this.name,
    required this.phoneNumber,
    required this.token,
  });
  late final String name;
  late final String phoneNumber;
  late final String token;

  LoginModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    token = json['token'];

    // currencies = List.from(json['currencies'])
    //     .map((e) => CurrencyModel.fromJson(e))
    //     .toList();

    // currencyNames = List.from(json['currencyNames'])
    //     .map((e) => CurrencyNamesModel.fromJson(e))
    //     .toList();
  }
}
