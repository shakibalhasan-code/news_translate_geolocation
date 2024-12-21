import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:soft_news_ai/core/services/location_services.dart';
import 'package:soft_news_ai/styles/app_colors.dart';
import 'package:soft_news_ai/views/screens/home/home_screen.dart';
import 'package:soft_news_ai/views/widgets/custom_button.dart';
import 'package:soft_news_ai/views/widgets/gradiunt_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final LocationServices _locationServices = Get.put(LocationServices());

  @override
  void initState() {
    super.initState();
    _locationServices.getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return ParentGradiuntWidget(
      child: Stack(
        children: [
          // Display location message
          Positioned(
            top: MediaQuery.of(context).size.height * 0.4,
            left: 16,
            right: 16,
            child: Obx(() {
              // Use Obx only for reactive variables
              return _locationServices.isLoading.value
                  ? Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : Column(
                      children: [
                        Text(
                          'Welcome to Soft News AI',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontSize: 15, color: Colors.white),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    );
            }),
          ),
          // Positioned button at the bottom
          Positioned(
            left: 16,
            right: 16,
            bottom: 40,
            child: Obx(() {
              // Show loading indicator on the button while fetching location
              return InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeScreen(
                              countryCode: _locationServices.country.value,
                            ))),
                child: CustomButton(
                  text: _locationServices.isLoading.value
                      ? 'Loading...'
                      : 'Continue',
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
