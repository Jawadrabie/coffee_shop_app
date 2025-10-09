import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        initialCenter: const LatLng(33.5138, 36.2765),
        initialZoom: 13,
      ),
      children: [
        TileLayer(
          urlTemplate:
              'https://cartodb-basemaps-a.global.ssl.fastly.net/light_all/{z}/{x}/{y}.png',
          subdomains: const ['a', 'b', 'c'],
          userAgentPackageName: 'com.coffee_shop_app.app',
        ),
        PolylineLayer(
          polylines: [
            Polyline(
              points: const [
                LatLng(33.5138, 36.2765),
                LatLng(33.5200, 36.3000),
                LatLng(33.5400, 36.3587),
              ],
              color: const Color(0xFFC67C4E),
              strokeWidth: 4.0,
            ),
          ],
        ),
        MarkerLayer(
          markers: [
            Marker(
              point: const LatLng(33.5400, 36.3587),
              width: 40,
              height: 40,
              child: const Icon(
                Icons.location_on,
                color: Color(0xFFC67C4E),
                size: 40,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
