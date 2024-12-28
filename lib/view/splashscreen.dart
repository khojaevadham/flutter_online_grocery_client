
import 'package:dcgrocer/view/home/home_view.dart';
import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';

import 'login/location_view.dart';
import 'main_tab_view/main_tabview.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void initState() {
    super.initState();
    openApp();
  }

  void openApp() async{
    await Future.delayed(const Duration(seconds: 2));
    startApp();
  }

  void startApp(){
    // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const Homepage()), (route)=>  false);    
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LocationView()), (route)=>  false);
  }

  //
  // Position? _currentLocation;
  // late bool _serviceEnabled;
  // late LocationPermission _permission;
  // String _currentAddress = '';
  // // String _message = '';

  @override
  Widget build(BuildContext context) {
 
    var media = MediaQuery.sizeOf(context);

    return Scaffold(
        body: Stack(
          children: [
            Image.asset("assets/img/background_images/back_dc.png", width: media.width,height: media.height, fit: BoxFit.cover,),
            Center(  
            child: Image.asset('assets/img/logotips/dc_logo.png',width: media.width*0.5,),          
            ),
          ],
        )
    );
  }

  //  Future<void> _getLatLng() async {
  //   _serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //    if (!_serviceEnabled) {
  //     return;
  //   }
  //   _permission = await Geolocator.checkPermission();
  //   if (_permission == LocationPermission.denied) {
  //     _permission = await Geolocator.requestPermission();
  //     if (_permission != LocationPermission.whileInUse &&
  //         _permission != LocationPermission.always) {
  //       return;
  //     }
  //   }
  //
  //   _currentLocation = await Geolocator.getCurrentPosition();
  //   if (_currentLocation != null) {
  //     await _getAddress();
  //   }
  // }
  //
  // Future<void> _getAddress() async {
  //   try {
  //     List<Placemark> placemarks = await placemarkFromCoordinates(
  //       _currentLocation!.latitude,
  //       _currentLocation!.longitude,
  //     );
  //     Placemark place = placemarks[0];
  //     setState(() {
  //        // _currentAdress = "${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}";
  //       // _currentAddress = "${place.locality}, ${place.street}";
  //       _currentAddress = "${place.street}";
  //       print(_currentAddress);
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

}