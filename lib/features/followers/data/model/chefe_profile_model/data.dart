import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'chef.dart';
import 'foods.dart';

class Data extends Equatable {
  final Chef? chef;
  final Foods? foods;

  const Data({this.chef, this.foods});

  factory Data.fromMap(Map<String, dynamic> data) => Data(
    chef:
        data['chef'] == null
            ? null
            : Chef.fromMap(data['chef'] as Map<String, dynamic>),
    foods:
        data['foods'] == null
            ? null
            : Foods.fromMap(data['foods'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toMap() => {
    'chef': chef?.toMap(),
    'foods': foods?.toMap(),
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Data].
  factory Data.fromJson(String data) {
    return Data.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Data] to a JSON string.
  String toJson() => json.encode(toMap());

  Data copyWith({Chef? chef, Foods? foods}) {
    return Data(chef: chef ?? this.chef, foods: foods ?? this.foods);
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [chef, foods];
}
