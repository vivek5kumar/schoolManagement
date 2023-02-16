import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({super.key});

  @override
  State<GoogleMapPage> createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  late GoogleMapController mapController; //contrller for Google map
  final Set<Marker> markers = Set(); //markers for google map
  static const LatLng showLocation = LatLng(27.7089427, 85.3086209);

  List<City> cities = [
    City("Zagreb", LatLng(45.792565, 15.995832)),
    City("Ljubljana", LatLng(46.037839, 14.513336)),
    City("Novo Mesto", LatLng(45.806132, 15.160768)),
    City("Varaždin", LatLng(46.302111, 16.338036)),
    City("Maribor", LatLng(46.546417, 15.642292)),
    City("Rijeka", LatLng(45.324289, 14.444480)),
    City("Karlovac", LatLng(45.489728, 15.551561)),
    City("Klagenfurt", LatLng(46.624124, 14.307974)),
    City("Graz", LatLng(47.060426, 15.442028)),
    City("Celje", LatLng(46.236738, 15.270346))
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.88,
            child: GoogleMap(
              //Map widget from google_maps_flutter package
              zoomGesturesEnabled: true, //enable Zoom in, out on map
              initialCameraPosition: const CameraPosition(
                //innital position in map
                target: showLocation, //initial position
                zoom: 15.0, //initial zoom level
              ),
              markers: getmarkers(), //markers to show on map
              mapType: MapType.normal, //map type
              onMapCreated: (controller) {
                //method called when map is created
                setState(() {
                  mapController = controller;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  getmarkers() {
    //markers to place on map
    for (int i = 0; i < cities.length; i++)
      // ignore: curly_braces_in_flow_control_structures
      setState(() {
        markers.add(Marker(
          //add first marker
          markerId: MarkerId(showLocation.toString()),
          position: showLocation, //position of marker
          infoWindow: InfoWindow(
            //popup info
            title: cities[i].name,
            snippet: 'My Custom Subtitle',
          ),
          icon: BitmapDescriptor.defaultMarker, //Icon for Marker
        ));
        //add more markers here
      });

    return markers;
  }
}

class City {
  final String name;
  final LatLng position;
  City(this.name, this.position);
}
