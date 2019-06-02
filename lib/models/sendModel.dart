class SendModel {
  final String publicKey;
  final String privateKey;
  final String amount;

  SendModel({this.publicKey, this.privateKey, this.amount});

  factory SendModel.fromJson(Map<String, dynamic> parsedJson) {
    return SendModel(
      publicKey: parsedJson['PublicKey'],
      privateKey: parsedJson['PrivateKey'],
      amount: parsedJson['PrivateKey'],
    );
  }

  Map<String, dynamic> toJson() =>
      {'PublicKey': publicKey, 'PrivateKey': privateKey, 'Amount': amount};
}
