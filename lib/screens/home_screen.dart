import 'package:flutter/material.dart';
import 'categorias_screen.dart'; // Importar la pantalla de categorías
import 'locales_screen.dart'; // Importar la pantalla de Locales

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.black), // Icono de menú
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Abrir el drawer al hacer clic
            },
          ),
        ),
        title: Image.asset(
          'assets/imagen_logo2.jpg', // Ruta del logo
          height: 40, // Tamaño del logo
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.grid_view, color: Colors.black),
            onPressed: () {
              // Acción para cambiar la vista (cuadrícula o lista)
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF3B1073), // Color del encabezado del drawer
              ),
              child: Text(
                'Menú de opciones',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Cuenta'),
              onTap: () {
                // Acción para ir a la pantalla de Cuenta
              },
            ),
            ListTile(
              leading: const Icon(Icons.category),
              title: const Text('Categorías'),
              onTap: () {
                // Navegar a la pantalla de Categorías
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CategoriesScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.local_offer),
              title: const Text('Descuentos'),
              onTap: () {
                // Acción para ir a la pantalla de Descuentos
              },
            ),
            ListTile(
              leading: const Icon(Icons.receipt),
              title: const Text('Pedidos'),
              onTap: () {
                // Acción para ir a la pantalla de Pedidos
              },
            ),
            ListTile(
              leading: const Icon(Icons.store),
              title: const Text('Locales'),
              onTap: () {
                // Navegar a la pantalla de Locales (Google Maps)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LocalesScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Barra de búsqueda
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Buscar...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Filtros de categorías
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilterButton(label: 'Todos', selected: true),
                FilterButton(label: 'Marinos'),
                FilterButton(label: 'Criollos'),
                FilterButton(label: 'Brasas'),
              ],
            ),
            const SizedBox(height: 20),
            // Título de Productos Destacados
            const Text(
              'Productos destacados',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // Grid de productos
            Expanded(
              child: GridView.count(
                crossAxisCount: 2, // Dos columnas
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: const [
                  ProductCard(
                    imagePath: 'assets/ceviche.png', // Ruta de la imagen del producto
                    title: 'Ceviche mixto',
                    description: 'Descripción del Producto',
                    price: 's/ 35',
                  ),
                  ProductCard(
                    imagePath: 'assets/pachamanca.png',
                    title: 'Pachamanca',
                    description: 'Descripción del Producto',
                    price: 's/ 60',
                  ),
                  ProductCard(
                    imagePath: 'assets/parrilla.png',
                    title: 'Parrilla para Dos',
                    description: 'Descripción del Producto',
                    price: 's/ 75',
                  ),
                  ProductCard(
                    imagePath: 'assets/trio_marino.png',
                    title: 'Trio Marino',
                    description: 'Descripción del Producto',
                    price: 's/ 45',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Clase para el botón de filtro
class FilterButton extends StatelessWidget {
  final String label;
  final bool selected;

  const FilterButton({super.key, required this.label, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Acción para filtrar productos
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: selected ? Colors.black : Colors.grey[300],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(label, style: TextStyle(color: selected ? Colors.white : Colors.black)),
    );
  }
}

// Tarjeta de producto
class ProductCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String price;

  const ProductCard({super.key, 
    required this.imagePath,
    required this.title,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen del producto
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              imagePath,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(description, style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 10),
                Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          // Botón de favoritos
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              onPressed: () {
                // Acción para agregar a favoritos
              },
              icon: const Icon(Icons.favorite_border),
            ),
          ),
        ],
      ),
    );
  }
}
