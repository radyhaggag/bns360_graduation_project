import 'dart:convert';

import 'package:flutter/services.dart';

const _basePath = "assets/json";

Future<Map<String, dynamic>> loadJsonFromAsset(String fileName) async {
  String data = await rootBundle.loadString("$_basePath/$fileName");
  final jsonResult = json.decode(data) as Map<String, dynamic>;
  return jsonResult;
}
