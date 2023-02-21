import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;

class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({super.key});

  @override
  State<GoogleMapPage> createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  late GoogleMapController mapController;

  CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  static const CameraPosition _cameraPosition =
      CameraPosition(target: LatLng(28.6210, 77.3812), zoom: 14);

  // Uint8List? markerImage;

  List<String> images = [
    "assets/images/car.png",
    "assets/images/love.png",
    "assets/images/motorbike.png",
    "assets/images/motorbike.png",
    "assets/images/motorbike.png",
    "assets/images/placeholder.png",
  ];

  final List<LatLng> _latlang = [
    const LatLng(28.6210, 77.3812),
    const LatLng(28.5798, 77.3657),
    const LatLng(28.6076, 77.3683),
    const LatLng(28.5996, 77.3736),
    const LatLng(28.6055, 77.3769),
    const LatLng(28.6033, 77.3540)
  ];
  List<String> areaName = [
    "Gali No 2,Mamura Noida Sector 63",
    "Noida Sector 51",
    "Noida Sector 59",
    "Noida Sector 71",
    "Noida Sector 66",
    "Noida Sector 57",
  ];

  final List<Marker> _marker = [];

// make marker function iteration
  loadMarker() async {
    for (int i = 0; i < images.length; i++) {
      final Uint8List markerList = await getImages(images[i].toString(), 100);
      _marker.add(Marker(
          markerId: MarkerId(i.toString()),
          position: _latlang[i],
          icon: BitmapDescriptor.fromBytes(markerList),
          infoWindow: InfoWindow(
            title: areaName[i],
          )));
      setState(() {});
    }
  }

  Future<Uint8List> getImages(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  @override
  void initState() {
    super.initState();
    loadMarker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: GoogleMap(
          myLocationEnabled: false,
          zoomGesturesEnabled: true,
          markers: Set<Marker>.of(_marker),
          initialCameraPosition: _cameraPosition,
          mapType: MapType.normal,
          onMapCreated: (controller) {
            setState(() {
              mapController = controller;
            });
          },
        ),
      ),
    );
  }
}
