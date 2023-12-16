import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';

import '../utils/ansi_color_debug.dart';

part 'dio_provider.g.dart';

@riverpod
Dio dio(DioRef ref) {
  String url = 'https://www.boredapi.com/api/activity';
  debugPrint(info('### Dio url : $url ###'));
  return Dio(BaseOptions(baseUrl: url));
}
