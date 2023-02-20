import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomeInfoWindowPage extends StatefulWidget {
  const CustomeInfoWindowPage({super.key});

  @override
  State<CustomeInfoWindowPage> createState() => _CustomeInfoWindowPageState();
}

class _CustomeInfoWindowPageState extends State<CustomeInfoWindowPage> {
  CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  static const CameraPosition _cameraPosition =
      CameraPosition(target: LatLng(28.6210, 77.3812), zoom: 14);

  final List<LatLng> _latlang = [
    const LatLng(28.6210, 77.3812),
    const LatLng(28.5798, 77.3657),
    const LatLng(28.6076, 77.3683),
    const LatLng(28.5996, 77.3736)
  ];
  final List<Marker> _marker = [];

  loaddata() {
    for (int i = 0; i < _latlang.length; i++) {
      _marker.add(Marker(
          markerId: MarkerId(i.toString()),
          position: _latlang[i],
          onTap: () {
            _customInfoWindowController.addInfoWindow!(
                Column(
                  children: [
                    Container(
                      height: 170,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.red),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 80,
                            width: 200,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("assets/images/citizen.jpg"),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Description:",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  "A good, affordable watch has a quartz movement or a certified mechanical  You will almost always find a quartz movement",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                _latlang[i]);
          },
          icon: BitmapDescriptor.defaultMarker));
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    loaddata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Info"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: _cameraPosition,
              markers: Set<Marker>.of(_marker),
              onMapCreated: (controller) {
                _customInfoWindowController.googleMapController = controller;
              },
              onTap: (position) {
                _customInfoWindowController.hideInfoWindow!();
              },
            ),
            CustomInfoWindow(
              controller: _customInfoWindowController,
              width: 300,
              height: 350,
            )
          ],
        ),
      ),
    );
  }
}
