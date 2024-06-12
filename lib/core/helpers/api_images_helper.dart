import '../utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';

abstract class APIImagesHelper {
  // static const String _baseURL = 'https://image.tmdb.org/t/p/';
  // static const String _defaultSize = 'w500';

  // static String getPosterPath(String path) {
  //   return '$_baseURL$_defaultSize$path';
  // }

  static Future<MultipartFile?> convertImageToMultipartFile(
    String? imagePath,
  ) async {
    if ((imagePath ?? "").isEmpty) return null;
    if(imagePath!.contains("http")) {
      return null;
    }
    String fileName = basename(imagePath);
    return await MultipartFile.fromFile(
      imagePath,
      filename: fileName,
      contentType: MediaType('image', 'jpeg'),
    );
  }

  static String? toServerImage(
    String? imageName, {
    bool addDefault = false,
  }) {
    if (addDefault && (imageName ?? "").isEmpty) {
      return kDefaultImgUrl;
    }
    return imageName;
  }
}
