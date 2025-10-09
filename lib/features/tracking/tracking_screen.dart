import 'package:flutter/material.dart';
import '../../widgets/map_widget.dart';
import '../../widgets/tracking_header.dart';
import '../../widgets/delivery_status_card.dart';
import '../../widgets/driver_info_card.dart';
import '../../widgets/progress_steps.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          const MapWidget(),

          // القسم السفلي
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const TrackingHeader(),
                  const SizedBox(height: 15),

                  const Text(
                    "10 minutes left",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Delivery to Jl. Kpg Sutoyo",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 15),

                  const ProgressSteps(),
                  const SizedBox(height: 20),

                  const DeliveryStatusCard(),
                  const SizedBox(height: 20),

                  const DriverInfoCard(),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
