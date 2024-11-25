import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  try {
    await Firebase.initializeApp(); // Inicializamos Firebase
    runApp(const MyApp());
  } catch (e) {
    print('Error inicializando Firebase: $e');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Autenticación',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const HomeScreen(), // Inicio con la pantalla principal
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showLogin = true; // Controla si se muestra el formulario de login o registro

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Asegura que el teclado no cubra la vista
      body: Stack(
        children: [
          // Imagen de fondo que cubre toda la pantalla
          Positioned.fill(
            child: Image.asset(
              'assets/imagen_fondo.jpg',
              fit: BoxFit.cover, // Ajusta la imagen para cubrir la pantalla
            ),
          ),
          // Contenido desplazable
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Logo en la parte superior
                Image.asset(
                  'assets/imagen_logo.jpg',
                  width: 200, // Tamaño del logo
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 5,
                          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Botones de alternancia entre Iniciar Sesión y Registrarse
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          showLogin = true;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: showLogin
                                            ? const Color(0xFF3B1073)
                                            : Colors.grey,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 20),
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30),
                                            bottomLeft: Radius.circular(30),
                                          ),
                                        ),
                                      ),
                                      child: const Text('Iniciar Sesión'),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          showLogin = false;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: !showLogin
                                            ? const Color(0xFF3B1073)
                                            : Colors.grey,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 20),
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(30),
                                            bottomRight: Radius.circular(30),
                                          ),
                                        ),
                                      ),
                                      child: const Text('Registrarse'),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                // Mostrar LoginScreen o RegisterScreen
                                showLogin ? LoginScreen() : RegisterScreen(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
