import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  
  final List<Map<String, String>> categories = [
    {
      'title': 'Promociones',
      'image': 'assets/pollo_brasa.png', 
    },
    {
      'title': 'Combos DondeLucho',
      'image': 'assets/pollo_brasa.png',
    },
    {
      'title': 'Pollo a la brasa',
      'image': 'assets/pollo_brasa.png',
    },
    {
      'title': 'Carnes y parrillas',
      'image': 'assets/pollo_brasa.png',
    },
    {
      'title': 'Entradas y piqueos',
      'image': 'assets/pollo_brasa.png',
    },
    {
      'title': 'Ensaladas DondeLucho',
      'image': 'assets/pollo_brasa.png',
    },
    {
      'title': 'Complementos',
      'image': 'assets/pollo_brasa.png',
    },
    {
      'title': 'Postres de la casa',
      'image': 'assets/pollo_brasa.png',
    },
    {
      'title': 'Bebidas',
      'image': 'assets/pollo_brasa.png',
    },
  ];

  CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorías'),
        backgroundColor: const Color(0xFF3B1073),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Barra de búsqueda
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Buscar',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Lista de categorías
            Expanded(
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0), // Espaciado entre elementos
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          categories[index]['image']!, // Imagen de la categoría
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        categories[index]['title']!, // Título de la categoría
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Acción cuando se selecciona una categoría (navegar a la página de productos)
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
