import 'package:flutter/material.dart';
import 'package:google_static_maps_controller/google_static_maps_controller.dart';

class ShowMap extends StatelessWidget {
  const ShowMap({
    Key? key,
    required this.lat, required this.lng,
  }) : super(key: key);

  final double lat;
  final double lng;

  @override
  Widget build(BuildContext context) {
    // List<Marker> markers = [];
    // markers.add(
    //   Marker(
    //     markerId: MarkerId("1"),
    //     draggable: true,
    //     position: latLng,
    //     infoWindow: InfoWindow(title: "강의장소"),
    //   ),
    // );
    //
    // return GoogleMap(
    //
    //   initialCameraPosition: CameraPosition(
    //     target: latLng,
    //     zoom: 17,
    //   ),
    //   markers: Set.from(markers),
    // );
    return StaticMap(
      scaleToDevicePixelRatio: true,
      googleApiKey: "AIzaSyBt7lf9SdyEJ3740KjQeb2xsVXIfHKnwz8",
      language: "ko",
      zoom: 17,
      markers: [
        Marker(
          color: Color(0xffea3c33),
          label: "ㅇ",
          locations: [
            GeocodedLocation.latLng(lat, lng),
          ],
        ),
      ],
    );
  }
}
