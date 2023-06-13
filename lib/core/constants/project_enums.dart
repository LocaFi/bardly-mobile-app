enum SystemVariablesEnums {
  MOBILE_IOS_MARKET_ID('MOBILE_IOS_MARKET_ID'),
  MOBILE_ANDRIOD_MARKET_ID('MOBILE_ANDRIOD_MARKET_ID'),
  MOBILE_SHOW_ADVERTISE('MOBILE_SHOW_ADVERTISE');

  const SystemVariablesEnums(this.value);
  final String value;

  String get usecase => value;
}
