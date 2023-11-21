import 'dart:convert';

import 'package:bns360_graduation_project/core/api/dio_consumer.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'dio_consumer_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<HttpClientAdapter>(),
])
void main() {
  late Dio dio;
  late DioConsumer dioConsumer;
  late MockHttpClientAdapter mockHttpClientAdapter;

  setUp(() {
    dio = Dio();
    mockHttpClientAdapter = MockHttpClientAdapter();
    dio.httpClientAdapter = mockHttpClientAdapter;
    dioConsumer = DioConsumer(dio: dio);
  });

  group('DioConsumer Success requests', () {
    test(
        'Should make a successful request when call dioConsumer.get for any request',
        () async {
      // arrange
      final responsePayload = jsonEncode({"response_code": "1000"});

      final httpResponse = ResponseBody.fromString(
        responsePayload,
        200,
        headers: {
          Headers.contentTypeHeader: [Headers.jsonContentType],
        },
      );

      when(mockHttpClientAdapter.fetch(any, any, any)).thenAnswer(
        (_) async => httpResponse,
      );
      // act
      final response = await dioConsumer.get(
        endpoint: 'endpoint',
      );

      // assert
      final expected = {"response_code": "1000"};
      expect(response.data, expected);
    });
    test(
        'Should make a successful request when call dioConsumer.post for any request with body',
        () async {
      // arrange
      final responsePayload = jsonEncode({"response_code": "1000"});

      final httpResponse = ResponseBody.fromString(
        responsePayload,
        200,
        headers: {
          Headers.contentTypeHeader: [Headers.jsonContentType],
        },
      );

      when(mockHttpClientAdapter.fetch(any, any, any)).thenAnswer(
        (_) async => httpResponse,
      );
      // act
      final response = await dioConsumer.post(
        endpoint: 'endpoint',
        data: {'name': "Rady"},
      );

      // assert
      final expected = {"response_code": "1000"};
      expect(response.data, expected);
    });
    test(
        'Should make a successful request when call dioConsumer.patch for any request with body',
        () async {
      // arrange
      final responsePayload = jsonEncode({"response_code": "1000"});

      final httpResponse = ResponseBody.fromString(
        responsePayload,
        200,
        headers: {
          Headers.contentTypeHeader: [Headers.jsonContentType],
        },
      );

      when(mockHttpClientAdapter.fetch(any, any, any)).thenAnswer(
        (_) async => httpResponse,
      );
      // act
      final response = await dioConsumer.patch(
        endpoint: 'endpoint',
        data: {'name': "Rady"},
      );

      // assert
      final expected = {"response_code": "1000"};
      expect(response.data, expected);
    });
  });
  group(
    'DioConsumer Error requests',
    () {
      test(
          'Should throw DioException when call dioConsumer.get for any request',
          () async {
        // arrange
        final responsePayload = jsonEncode({"response_code": "1000"});

        final httpResponse = ResponseBody.fromString(
          responsePayload,
          400,
          headers: {
            Headers.contentTypeHeader: [Headers.jsonContentType],
          },
        );

        when(mockHttpClientAdapter.fetch(any, any, any)).thenAnswer(
          (_) async => httpResponse,
        );

        // assert
        expect(
          () => dioConsumer.get(endpoint: 'endpoint'),
          throwsA(isA<DioException>()),
        );
      });
      test(
          'Should throw DioException when call dioConsumer.post for any request with body',
          () async {
        // arrange
        final responsePayload = jsonEncode({"response_code": "1000"});

        final httpResponse = ResponseBody.fromString(
          responsePayload,
          400,
          headers: {
            Headers.contentTypeHeader: [Headers.jsonContentType],
          },
        );

        when(mockHttpClientAdapter.fetch(any, any, any)).thenAnswer(
          (_) async => httpResponse,
        );

        // assert
        expect(
          () => dioConsumer.post(endpoint: 'endpoint', data: {'': ""}),
          throwsA(isA<DioException>()),
        );
      });
      test(
        'Should throw DioException when call dioConsumer.patch for any request with body',
        () async {
          // arrange
          final responsePayload = jsonEncode({"response_code": "1000"});

          final httpResponse = ResponseBody.fromString(
            responsePayload,
            400,
            headers: {
              Headers.contentTypeHeader: [Headers.jsonContentType],
            },
          );

          when(mockHttpClientAdapter.fetch(any, any, any)).thenAnswer(
            (_) async => httpResponse,
          );
          // assert
          expect(
            () => dioConsumer.patch(endpoint: 'endpoint', data: {'': ""}),
            throwsA(isA<DioException>()),
          );
        },
      );
    },
  );
}
