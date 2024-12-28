import 'dart:convert';
import 'dart:developer';
import 'package:dcgrocer/same_widgets/round_button.dart';
import 'package:dcgrocer/view/main_tab_view/main_tabview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart' as loc;
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';


import '../../common/color_extension.dart';
import 'choice_type_vitrin.dart';

class LocationView extends StatefulWidget {
  const LocationView({super.key});

  @override
  State<LocationView> createState() => _LocationViewState();
}

  class _LocationViewState extends State<LocationView> {

    TextEditingController _addressController = TextEditingController();
    TextEditingController _searchController = TextEditingController();
    MapController mapController = MapController();

    loc.Location location = loc.Location();
    bool _serviceEnabled = false;
    loc.PermissionStatus? _permissionGranted;
    loc.LocationData? _locationData;


    final LatLng _dushanbeCoordinates = LatLng(38.573835, 68.784895);
    double _currentZoom = 16.0;
    LatLng? _searchedLocation;
    Placemark? _currentAddress;

    bool _isSearchOpen = false;

    @override
    void initState() {
      super.initState();
      initLocation();
    }

    // void _toggleSearch() {
    //   setState(() {
    //     _isSearchOpen = !_isSearchOpen;
    //   });
    // }


    Future<void> initLocation() async {
      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          mapController.move(_dushanbeCoordinates, _currentZoom);
          return;
        }
      }

      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == loc.PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != loc.PermissionStatus.granted) {
          mapController.move(_dushanbeCoordinates, _currentZoom);
          return;
        }
      }

      if (_permissionGranted == loc.PermissionStatus.deniedForever) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Доступ к геолокации запрещен"),
              content: Text(
                  "Чтобы включить доступ к геолокации, перейдите в настройки приложения."),
              actions: [
                TextButton(
                  child: Text("Настройки"),
                  onPressed: ()  async {
                    await openAppSettings();
                  },
                ),
              ],
            );
          },
        );
        return;
      }

      _locationData = await location.getLocation();
      if (_locationData != null) {
        await _getAddressFromCoordinates(LatLng(_locationData!.latitude!, _locationData!.longitude!));

        mapController.move(LatLng(_locationData!.latitude!, _locationData!.longitude!), _currentZoom);
        setState(() {});
      } else {
        mapController.move(_dushanbeCoordinates, _currentZoom);
      }
    }

    Future<void> _getAddressFromCoordinates(LatLng coordinates) async {
      try {
        List<Placemark> placemarks = await placemarkFromCoordinates(coordinates.latitude, coordinates.longitude);

        if (placemarks.isNotEmpty) {
          Placemark place = placemarks.first;

          String fullAddress = "${place.locality}, ${place.street}";

          setState(() {
            _currentAddress = place;
            _addressController.text = fullAddress;
          });
          print("${fullAddress}");
        }
      } catch (e) {
        log('Ошибка получения адреса: $e');
      }
    }

    //
    // Future<void> _searchLocationByAddress(String address) async {
    //   try {
    //     List<Location> locations = await locationFromAddress(address);
    //     if (locations.isNotEmpty) {
    //       Location location = locations.first;
    //       LatLng newLocation = LatLng(location.latitude, location.longitude);
    //
    //       setState(() {
    //         _searchedLocation = newLocation;
    //         mapController.move(newLocation, _currentZoom);
    //       });
    //     }
    //   } catch (e) {
    //     print('Ошибка поиска по адресу: $e');
    //   }
    // }


    Future<void> _searchLocationByAddress(String address) async {
      final url = Uri.parse('https://nominatim.openstreetmap.org/search?q=$address&format=json&limit=1');

      try {
        final response = await http.get(url);

        if (response.statusCode == 200) {
          List data = json.decode(response.body);

          if (data.isNotEmpty) {
            var locationData = data[0];
            LatLng newLocation = LatLng(
              double.parse(locationData['lat']),
              double.parse(locationData['lon']),
            );

            setState(() {
              _searchedLocation = newLocation;
              mapController.move(newLocation, _currentZoom);
              _addressController.text = "${locationData['display_name']}";
            });

            print("Найдено местоположение: ${locationData['display_name'  ]}");
          } else {
            print("Адрес не найден");
          }
        } else {
          print("Ошибка при подключении к Nominatim API: ${response.statusCode}");
        }
      } catch (e) {
        print('Ошибка поиска по адресу: $e');
      }
    }

    @override
    void dispose() {
      _addressController.dispose();
      super.dispose();
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Stack(
              children: [

                FlutterMap(
                  mapController: this.mapController,
                  options: MapOptions(
                    initialZoom: 5,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.app',
                    ),
                    MarkerLayer(
                      markers: [
                        if (_locationData != null)
                          Marker(
                            point: LatLng(_locationData!.latitude!, _locationData!.longitude!),
                            width: 80,
                            height: 80,
                            child: const Icon(
                              Icons.location_on,
                              color: Colors.red,
                              size: 35,
                            ),
                          ),
                        if (_searchedLocation != null)
                          Marker(
                            point: _searchedLocation!,
                            width: 80,
                            height: 80,
                            child: const Icon(
                              Icons.location_on,
                              color: Colors.blue,
                              size: 35,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),

              Positioned(
                top: 75,
                right: 15,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      width: _isSearchOpen ? MediaQuery.of(context).size.width - 30 : 48,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                         ),
                     child : Row(
                       children: [
                         if (_isSearchOpen)

                         Expanded(
                           child: TextField(
                                controller: _searchController,
                                cursorColor: Colors.black54,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                                decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          _searchController.clear();
                                          _isSearchOpen = false;
                                        });
                                      },
                                      child: const Icon(
                                        Icons.close,
                                        size: 25,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintText: "Поиск",
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                      _searchLocationByAddress(_searchController.text);
                                    },
                                    child: Padding(
                                        padding: const EdgeInsets.all(11),
                                    child:  Image.asset(
                                      "assets/img/icons/search_2.png",
                                      width: 22,
                                      height: 22,
                                     ),
                                    )
                                  ),
                                ),
                              ),
                         ),
                         if (!_isSearchOpen)
                           IconButton(
                             icon: Image.asset(
                             "assets/img/icons/search_2.png",
                             width: 22,
                              height: 22,
                            ),
                             onPressed: () {
                               setState(() {
                                 _isSearchOpen = true;
                               });
                             },
                           ),
                       ],
                     ),
                ),
              ),

                Positioned(
                  bottom: 200,
                  right: 10,
                  child: Column(
                    children: [
                      FloatingActionButton(
                        heroTag: 'zoomIn',
                        backgroundColor: Colors.white,
                        onPressed: () {
                          setState(() {
                            if (_currentZoom < 21.0) _currentZoom++;
                            mapController.move(
                                mapController.camera.center, _currentZoom
                            );
                          });
                        },
                        child: Icon(Icons.add),
                      ),
                      const SizedBox(height: 10),
                      FloatingActionButton(
                        heroTag: 'zoomOut',
                        backgroundColor: Colors.white,
                        onPressed: () {
                          setState(() {
                            if (_currentZoom > 2.0) _currentZoom--;
                            mapController.move(
                                mapController.camera.center, _currentZoom
                            );

                          });
                        },
                        child: Icon(Icons.remove),
                      ),
                    ],
                  ),
                ),

                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(bottom: 20, right: 20, left: 20, top: 7),
                    decoration: const BoxDecoration(
                      color:  Colors.white,
                      borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(19),topRight: Radius.circular(19))
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/img/icons/handle.png',
                                height: 7,
                                width: 60,
                            )
                          ],
                        ),

                        const SizedBox(height: 25,),

                        TextField(
                          controller:
                          _addressController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 12,horizontal: 10),
                            labelText: "Адрес",
                            labelStyle: TextStyle(
                                color: BColor.textfiled,
                                fontWeight: FontWeight.w600,
                                fontSize: 14
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54,
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54,),
                            ),
                          ),
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: BColor.textfiled
                          ),
                          cursorColor: BColor.textfiled,
                          cursorHeight: 30,
                          textAlignVertical: TextAlignVertical.center,
                          // floatingLabelBehavior: FloatingLabelBehavior.auto,
                        ),
                        const SizedBox(height: 15),
                        RoundButton(
                            title: 'Привезти сюда',
                            onPressed:  (){choice_type_vitrins();}
                                // (){
                              // Navigator.push(context, MaterialPageRoute(builder: (context) =>const  MainTabview()));
                              // Navigator.push(context, MaterialPageRoute(builder: (context) =>const  ChoiceTypeVitrin()));
                            // }
                        )
                      ],
                    ),
                  ),
                ),

              ],
            ),
      );
    }


    void choice_type_vitrins(){
      showDialog(
          context: context,
          builder: (context) => ChoiceTypeVitrin());
    }

  }


