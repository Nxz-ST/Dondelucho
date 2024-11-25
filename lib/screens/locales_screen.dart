import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocalesScreen extends StatefulWidget {
  const LocalesScreen({super.key});

  @override
  _LocalesScreenState createState() => _LocalesScreenState();
}

class _LocalesScreenState extends State<LocalesScreen> {
  late GoogleMapController mapController;

  // Coordenadas proporcionadas
  final LatLng _center = const LatLng(-12.00281801339978, -76.86786604070204);

  // Definir el marcador para la ubicación
  final Marker _marker = Marker(
    markerId: const MarkerId('LocalMarker'),
    position: const LatLng(-12.00281801339978, -76.86786604070204), // Ubicación exacta
    infoWindow: const InfoWindow(title: 'Local Donde Lucho'), // Título del marcador
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet), // Color del marcador
  );

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Locales'),
        backgroundColor: const Color(0xFF3B1073),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center, // Ubicación inicial de la cámara
          zoom: 15.0, // Nivel de zoom
        ),
        markers: {_marker}, // Marcador en el mapa
      ),
    );
  }
}
