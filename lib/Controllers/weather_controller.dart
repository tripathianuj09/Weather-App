import 'package:get/get.dart';
import 'package:weather_app/Helper/http_helper.dart';

const weatherAPIUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherController extends GetxController {
  RxBool isLoading = true.obs;
  RxString weatherMain = 'weather'.obs;

  RxString weatherDescribe = 'weather Description'.obs;
  RxString icon = 'Icon'.obs;

  RxDouble temperature = 0.0.obs;
  RxDouble minTemp = 0.0.obs;
  RxDouble maxTemp = 0.0.obs;
  RxDouble pressue = 0.0.obs;
  RxDouble humidity = 0.0.obs;
  RxDouble clouds = 0.0.obs;
  RxDouble seaLevel = 0.0.obs;
  RxDouble visibility = 0.0.obs;
  RxDouble wind = 0.0.obs;

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
        '$weatherAPIUrl?lat=$latitude&lon=$longitude&appid=e7be9efb5b9d5200aa8f6d3d16b72b49&units=metric');

    var weatherData = await networkHelper.getData();
    print(weatherData);
    weatherMain.value = weatherData['weather'][0]['main'];
    weatherDescribe.value = weatherData['weather'][0]['description'];
    icon.value='${"http://openweathermap.org/img/w/" +
    weatherData['weather'][0]['icon']}.png' ;
    temperature.value=weatherData['main']['temp']+0.0;
    minTemp.value=weatherData['main']['temp_min']+0.0;
    maxTemp.value=weatherData['main']['temp_max']+0.0;
    pressue.value=weatherData['main']['pressure']+0.0;
    humidity.value=weatherData['main']['humidity']+0.0;

    visibility.value=weatherData['visibility']+0.0;
    wind.value=weatherData['wind']['speed']+0.0;
    seaLevel.value=weatherData['main']['sea_level']+0.0;





  }
}
