import 'package:cartips_test_project/src/domain/entities/qrcode.dart';
import 'package:cartips_test_project/src/domain/entities/qrcode_category.dart';
import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import 'api_mocks.dart';

class QrcodesApi {
  late final Dio _client;
  late final DioAdapter _dioAdapter;
  static final instance = QrcodesApi._();

  QrcodesApi._() {
    _client = Dio(BaseOptions(baseUrl: 'https://api.example.com/v4'));
    _dioAdapter = DioAdapter(dio: _client);

    //Mock requests
    _dioAdapter.onGet('/categories', (server) {
      server.reply(
        200,
        categories,
        delay: const Duration(milliseconds: 500),
      );
    });
    _dioAdapter.onGet('/categories/0/qrcodes', (server) {
      server.reply(
        200,
        qrcodes0,
        delay: const Duration(milliseconds: 500),
      );
    });
    _dioAdapter.onGet('/categories/1/qrcodes', (server) {
      server.reply(
        200,
        qrcodes1,
        delay: const Duration(milliseconds: 500),
      );
    });
    _dioAdapter.onGet('/categories/2/qrcodes', (server) {
      server.reply(
        200,
        qrcodes2,
        delay: const Duration(milliseconds: 500),
      );
    });
    _dioAdapter.onGet('/categories/3/qrcodes', (server) {
      server.reply(
        200,
        qrcodes3,
        delay: const Duration(milliseconds: 500),
      );
    });
    _dioAdapter.onGet('/categories/4/qrcodes', (server) {
      server.reply(
        200,
        qrcodes4,
        delay: const Duration(milliseconds: 500),
      );
    });
  }

  Future<List<QrcodeCategory>?> getCategories() async {
    List<QrcodeCategory>? categories;
    try {
      final response = await _client.get<List<dynamic>>('/categories');
      categories = response.data
          ?.map((category) =>
              QrcodeCategory.fromMap(category as Map<String, dynamic>))
          .toList();
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        print('Error sending request!');
        print(e.message);
      }
      throw DioError(requestOptions: e.requestOptions);
    }

    return categories;
  }

  Future<List<Qrcode>?> getQrcodesOfCategory({required int id}) async {
    List<Qrcode>? qrcodesOfCategory;
    try {
      final response =
          await _client.get<List<dynamic>>('/categories/$id/qrcodes');
      qrcodesOfCategory = response.data
          ?.map((qrcode) => Qrcode.fromMap(qrcode as Map<String, dynamic>))
          .toList();
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        print('Error sending request!');
        print(e.message);
      }
      throw DioError(requestOptions: e.requestOptions);
    }
    return qrcodesOfCategory;
  }
}
