class ServerConfig {
  static const String urlSplash = "/splash";

  //Login Urls
  static const String urlAuthenticate = "/Authenticate";

  //Currency Urls
  static const String urlRequestCurrency = "/RequestCurrency";
  static String urlRequestCurrencies(q) => "/RequestCurrencies/$q";
  static const String urlGetArchivedRequestCurrency = "/GetArchivedRequestCurrency";
  static const String urlGetActiveRequestCurrency = "/GetActiveRequestCurrency";
  static const String urlHoldUserRequest = "/HoldUserRequest";
  static const String urlCancelRequestCurrency = "/CancelRequestCurrency";

  static const String urlMessageSendAccountNumber = "/MessageSendAccountNumber";
  static const String urlMessageAccountNumberForIncome = "/MessageAccountNumberForIncome";
  static const String urlMessagePleaseSendBalance = "/MessagePleaseSendBalance";
  static const String urlMessagePleaseSendAccountNumber = "/MessagePleaseSendAccountNumber";
  static const String urlRequestSellCurrency = "/SellCurrency";
  
}
