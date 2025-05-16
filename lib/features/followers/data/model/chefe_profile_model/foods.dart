import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'datum.dart';
import 'link.dart';

class Foods extends Equatable {
  final int? currentPage;
  final List<Datum>? data;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final List<Link>? links;
  final String? nextPageUrl;
  final String? path;
  final int? perPage;
  final dynamic prevPageUrl;
  final int? to;
  final int? total;

  const Foods({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory Foods.fromMap(Map<String, dynamic> data) => Foods(
    currentPage: data['current_page'] as int?,
    data:
        (data['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromMap(e as Map<String, dynamic>))
            .toList(),
    firstPageUrl: data['first_page_url'] as String?,
    from: data['from'] as int?,
    lastPage: data['last_page'] as int?,
    lastPageUrl: data['last_page_url'] as String?,
    links:
        (data['links'] as List<dynamic>?)
            ?.map((e) => Link.fromMap(e as Map<String, dynamic>))
            .toList(),
    nextPageUrl: data['next_page_url'] as String?,
    path: data['path'] as String?,
    perPage: data['per_page'] as int?,
    prevPageUrl: data['prev_page_url'] as dynamic,
    to: data['to'] as int?,
    total: data['total'] as int?,
  );

  Map<String, dynamic> toMap() => {
    'current_page': currentPage,
    'data': data?.map((e) => e.toMap()).toList(),
    'first_page_url': firstPageUrl,
    'from': from,
    'last_page': lastPage,
    'last_page_url': lastPageUrl,
    'links': links?.map((e) => e.toMap()).toList(),
    'next_page_url': nextPageUrl,
    'path': path,
    'per_page': perPage,
    'prev_page_url': prevPageUrl,
    'to': to,
    'total': total,
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Foods].
  factory Foods.fromJson(String data) {
    return Foods.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Foods] to a JSON string.
  String toJson() => json.encode(toMap());

  Foods copyWith({
    int? currentPage,
    List<Datum>? data,
    String? firstPageUrl,
    int? from,
    int? lastPage,
    String? lastPageUrl,
    List<Link>? links,
    String? nextPageUrl,
    String? path,
    int? perPage,
    dynamic prevPageUrl,
    int? to,
    int? total,
  }) {
    return Foods(
      currentPage: currentPage ?? this.currentPage,
      data: data ?? this.data,
      firstPageUrl: firstPageUrl ?? this.firstPageUrl,
      from: from ?? this.from,
      lastPage: lastPage ?? this.lastPage,
      lastPageUrl: lastPageUrl ?? this.lastPageUrl,
      links: links ?? this.links,
      nextPageUrl: nextPageUrl ?? this.nextPageUrl,
      path: path ?? this.path,
      perPage: perPage ?? this.perPage,
      prevPageUrl: prevPageUrl ?? this.prevPageUrl,
      to: to ?? this.to,
      total: total ?? this.total,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      currentPage,
      data,
      firstPageUrl,
      from,
      lastPage,
      lastPageUrl,
      links,
      nextPageUrl,
      path,
      perPage,
      prevPageUrl,
      to,
      total,
    ];
  }
}
