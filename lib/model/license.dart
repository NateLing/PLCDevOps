import 'dart:convert';

import 'package:intl/intl.dart';

class License {
  final String id;
  final String expectedDate;

  License(this.id, this.expectedDate);

  bool checkExpected() {
    DateTime expected = DateFormat('d/M/y').parse(expectedDate);
    return DateTime.now().millisecond > expected.millisecond;
  }

  static License fromString(String source) {
    return License.fromJson(jsonDecode(source));
  }

  License.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        expectedDate = json['expectedDate'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'expectedDate': expectedDate,
      };
}
