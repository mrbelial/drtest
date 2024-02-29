
class LoginModel {
  LoginModel({
    required this.name,
    required this.phoneNumber,
    required this.token,
  });
  late final String name;
  late final String phoneNumber;
  late final String token;
  late final String aboutus;

  LoginModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    token = json['token'];
    aboutus = json['aboutus'];
    
    // currencies = List.from(json['currencies'])
    //     .map((e) => CurrencyModel.fromJson(e))
    //     .toList();

    // currencyNames = List.from(json['currencyNames'])
    //     .map((e) => CurrencyNamesModel.fromJson(e))
    //     .toList();
  }
}
