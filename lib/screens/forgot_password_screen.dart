import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo que cubre toda la pantalla
          Positioned.fill(
            child: Image.asset(
              'assets/imagen_fondo.jpg', // Ruta a la imagen de fondo
              fit: BoxFit.cover, // Ajusta la imagen para cubrir toda la pantalla
            ),
          ),
          // Logo y el cuadro de recuperar contraseña
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Logo en la parte superior
                Image.asset(
                  'assets/imagen_logo.jpg', // Ruta al logo
                  width: 200, // Tamaño del logo
                ),
                const SizedBox(height: 20), // Espacio entre el logo y el cuadro de recuperar contraseña
                // Tarjeta con el formulario de recuperación
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
                        // Título
                        const Text(
                          'RECUPERAR CONTRASEÑA',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF3B1073),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Si olvidaste tu contraseña, puedes iniciar un proceso de recuperación.',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Te enviaremos el código de verificación a tu correo electrónico.',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        // Campo de correo
                        const TextField(
                          decoration: InputDecoration(
                            labelText: 'Correo',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Botón de Recuperar Contraseña
                        ElevatedButton(
                          onPressed: () {
                            // Acción de recuperación
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF3B1073),
                            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                          ),
                          child: const Text('Recuperar Contraseña'),
                        ),
                        const SizedBox(height: 20),
                        // Enlace para volver al registro
                        TextButton(
                          onPressed: () {
                            // Navegar a la pantalla de registro
                            Navigator.pop(context); // Vuelve a la pantalla anterior
                          },
                          child: const Text(
                            '¿No tienes cuenta? Regístrate',
                            style: TextStyle(color: Color(0xFF3B1073)),
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
