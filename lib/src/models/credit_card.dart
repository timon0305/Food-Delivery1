class CreditCard {
  String id;
  String number = '';
  String expMonth = '';
  String expYear = '';
  String cvc = '';

  CreditCard();

  CreditCard.fromJSON(Map<String, dynamic> jsonMap) {
    id = jsonMap['id'].toString();
    number = jsonMap['stripe_number'].toString();
    expMonth = jsonMap['stripe_exp_month'].toString();
    expYear = jsonMap['stripe_exp_year'].toString();
    cvc = jsonMap['stripe_cvc'].toString();
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["stripe_number"] = number;
    map["stripe_exp_month"] = expMonth;
    map["stripe_exp_year"] = expYear;
    map["stripe_cvc"] = cvc;
    return map;
  }
}
