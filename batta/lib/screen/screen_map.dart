import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  List<Marker> markers = [];

  @override
  void initState() {
    super.initState();
    addCustomMarkers();
  }

  void addCustomMarkers() {
    final List<LatLng> locations = [
      const LatLng(37.28020628270281, 127.04442741544098), // 아주대 야외 체육관
      const LatLng(37.28332967800612, 127.04083488004338), // 유신고 야구장
      const LatLng(37.26174271998503, 127.0257931750296), // 야구연습장
      const LatLng(37.30022854170339, 127.00958713508943), // 수원KT위즈파크
    ];

    for (int i = 0; i < locations.length; i++) {
      final marker = Marker(
        markerId: MarkerId('marker$i'),
        position: locations[i],
        // 추가적인 옵션들 설정 가능
        // icon: BitmapDescriptor.defaultMarker,
        // infoWindow: InfoWindow(title: 'Custom Marker $i'),
      );

      markers.add(marker);
    }

    setState(() {
      markers = markers;
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.grey,
          backgroundColor: const Color.fromARGB(255, 13, 32, 101),
          title: const Text('동네 지도'),
          centerTitle: true,
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: const CameraPosition(
            target: LatLng(37.28296604008742, 127.0435551162717),
            zoom: 15.0,
          ),
          markers: markers.toSet(),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: MapScreen(),
  ));
}
