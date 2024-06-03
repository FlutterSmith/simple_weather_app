import 'package:weather_app/models/weathermodel.dart';

abstract class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherInfoState extends WeatherState {
  final WeatherModel weatherModel;

  WeatherInfoState(this.weatherModel);
}

class WeatherFailureState extends WeatherState {
  final String errMessage;

  WeatherFailureState(this.errMessage);
}
