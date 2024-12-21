import 'package:free_map/services/fm_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationServices extends GetxService {
  var locationMessage =
      "Fetching location...".obs; // Reactive variable for updates
  late bool serviceEnabled;
  late LocationPermission permission;
  var isLoading = false.obs;
  var country = ''.obs;

  Future<void> getCurrentLocation() async {
    isLoading.value = true;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      isLoading.value = false;
      locationMessage.value = "Location services are disabled.";
      return;
    }

    // Check location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        isLoading.value = false;

        locationMessage.value = "Location permissions are denied.";
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      isLoading.value = false;

      locationMessage.value = "Location permissions are permanently denied.";
      return;
    }

    // Get current location
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      locationMessage.value =
          "It seems like you're from: ${position.latitude}, ${position.longitude}";
      final data = await FMService().getAddress(
        lat: position.latitude,
        lng: position.longitude,
      );
      country.value = data!.rawAddress!.countryCode;

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;

      locationMessage.value = "Failed to get location: $e";
    }
  }
}
