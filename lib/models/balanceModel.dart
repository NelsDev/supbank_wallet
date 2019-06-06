class BalanceModel {
  final int balance;

  BalanceModel({this.balance});

  factory BalanceModel.fromJson(Map<String, dynamic> parsedJson){
    return BalanceModel(
        balance: parsedJson["balance"]
    );
  }

  Map<String, dynamic> toJson() => {
    "balance": balance,
  };
}
