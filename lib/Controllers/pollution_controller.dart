import 'package:get/get.dart';
import 'package:weather_app/Helper/http_helper.dart';

const pollutionAPIUrl = 'http://api.openweathermap.org/data/2.5/air_pollution';

class PollutionController extends GetxController {
  RxBool isLoading = true.obs;

  // RxString weatherDescribe = 'weather Description'.obs;
  // RxString icon = 'Icon'.obs;

  RxDouble co = 0.0.obs;
  RxDouble no = 0.0.obs;
  RxDouble no2   = 0.0.obs;
  RxDouble o3 = 0.0.obs;
  RxDouble aqi = 0.0.obs;

  // RxDouble humidity = 0.0.obs;
  // RxDouble clouds = 0.0.obs;
  // RxDouble seaLevel = 0.0.obs;
  // RxDouble visibility = 0.0.obs;
  // RxDouble wind = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    getLocationWeather(22.7169, 75.8577);
  }

  @override
  void onClose() {
    // _locationContro.streamSubscription!.cancel();
  }

  Future<dynamic> getLocationWeather(double latitude, double longitude) async {
    NetworkData networkHelper = NetworkData(
        '$pollutionAPIUrl?lat=$latitude&lon=$longitude&appid=e7be9efb5b9d5200aa8f6d3d16b72b49&units=metric');

    var weatherData = await networkHelper.getData();
    print(weatherData);
    co.value = weatherData['list'][0]['components']['co']+0.0;
    no.value = weatherData['list'][0]['components']['no']+0.0;
    no2.value = weatherData['list'][0]['components']['no2']+0.0;
    o3.value = weatherData['list'][0]['components']['o3']+0.0;
    aqi.value = weatherData['list'][0]['main']['aqi']+0.0;



  }
}
