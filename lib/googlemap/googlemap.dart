import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;

class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({super.key});

  @override
  State<GoogleMapPage> createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  late GoogleMapController mapController;
  Uint8List? markerImage;
  static const CameraPosition _cameraPosition =
      CameraPosition(target: LatLng(28.6210, 77.3812), zoom: 14);
  List<Image> images = [
    Image.asset(
      'assets/images/love.png',
    ),
    Image.asset(
      'assets/images/motorbike.png',
    ),
    Image.asset(
      'assets/images/car.png',
    ),
    Image.asset(
      'assets/images/placeholder.png',
    )
  ];

  final List<LatLng> _latlang = [
    LatLng(28.6210, 77.3812),
    LatLng(28.5798, 77.3657),
    LatLng(28.6076, 77.3683),
    LatLng(28.5996, 77.3736)
  ];
  List<String> areaName = [
    "Noida Sector 63",
    "Noida Sector 51",
    "Noida Sector 59",
    "Noida Sector 71",
  ];

  List<Marker> _marker = [];

// make marker function iteration
  loadMarker() async {
    for (int i = 0; i < images.length; i++) {
      // final Uint8List markerList =
      //     await getBytesFromAssets(images[i].toString(), 100);
      _marker.add(Marker(
          markerId: MarkerId(i.toString()),
          position: _latlang[i],
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(
            title: areaName[i],
          )));
    }
  }

  // Future<Uint8List> getBytesFromAssets(String path, int width) async {
  //   ByteData data = await rootBundle.load(path);
  //   ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
  //       targetWidth: width);
  //   ui.FrameInfo fi = await codec.getNextFrame();
  //   return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
  //       .buffer
  //       .asUint8List();
  // }

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
