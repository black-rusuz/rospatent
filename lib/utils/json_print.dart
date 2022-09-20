import 'dart:convert';

import 'package:flutter/foundation.dart';

class JsonPrint {
  JsonPrint(Object? json) {
    const JsonEncoder encoder = JsonEncoder.withIndent('  ');
    final String output = encoder.convert(json);
    debugPrint(output);
  }
}
