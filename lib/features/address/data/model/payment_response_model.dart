class PaymentResponseModel {
  final bool status;
  final String message;
  final String? paymentUrl;

  PaymentResponseModel({
    required this.status,
    required this.message,
    this.paymentUrl,
  });

  factory PaymentResponseModel.fromJson(Map<String, dynamic> json) {
    return PaymentResponseModel(
      status: json['status'] ?? true,
      message: json['message'] ?? '',
      paymentUrl: json['paymentUrl'],
    );
  }
}
