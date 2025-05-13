import 'package:equatable/equatable.dart';

import 'order.dart';

class Data extends Equatable {
  final Order? order;

  const Data({this.order});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    order:
        json['order'] == null
            ? null
            : Order.fromJson(json['order'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {'order': order?.toJson()};

  Data copyWith({Order? order}) {
    return Data(order: order ?? this.order);
  }

  @override
  List<Object?> get props => [order];
}
