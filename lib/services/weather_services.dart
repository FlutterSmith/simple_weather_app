import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weathermodel.dart';

class WeatherService {
  final Dio dio;

  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = 'b8d47058f8d7472cae4195150240501';

  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      final response = await dio.get(
        '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1',
      );

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    } on DioException catch (e) {
      // TODO
      final String errorMessege = e.response?.data['error']['message'] ??
          'there something went wrong, please try again after few hours';
      throw Exception(errorMessege);
    } catch (e) {
      log(e.toString());
      throw Exception('opps there was an error , try later');
    }
  }
}
