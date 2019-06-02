class BalanceModel {
  final int id;

  BalanceModel({this.id});

  factory BalanceModel.fromJson(Map<String, dynamic> parsedJson){
    return BalanceModel(
        id: parsedJson['id']
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
  };
}
