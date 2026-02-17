import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: const ElectroPage(),
      debugShowCheckedModeBanner: false,
    ));

class ElectroPage extends StatelessWidget {
  const ElectroPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Colores: Azul para lo general, Morado solo para las secciones
    final Color bgBody = Color(0xFFE0E0E0); 
    final Color bannerBlue = Color(0xFFB2EBF2); 
    final Color sectionPurple = Color(0xFFD1C4E9); 

    return Scaffold(
      backgroundColor: bgBody,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Barra Login (Azul como antes)
              Container(
                color: bannerBlue,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Login', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                    SizedBox(width: 10),
                    Icon(Icons.menu, size: 28),
                  ],
                ),
              ),

              // Banner ELECTRO (Azul como antes)
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.symmetric(vertical: 40),
                decoration: BoxDecoration(
                  color: bannerBlue, 
                  borderRadius: BorderRadius.circular(2)
                ),
                child: Center(
                  child: Text(
                    'ELECTRO', 
                    style: TextStyle(
                      fontSize: 60, 
                      fontWeight: FontWeight.bold, 
                      letterSpacing: 10, 
                      color: Colors.black54
                    )
                  ),
                ),
              ),

              // TABS EN MORADO PASTEL (Lo único morado)
              Row(
                children: [
                  _buildTab("section", true, sectionPurple),
                  _buildTab("section", false, sectionPurple),
                  _buildTab("section", false, sectionPurple),
                ],
              ),

              // Contenedor de productos responsivo (800px max para Web)
              Center(
                child: Container(
                  constraints: BoxConstraints(maxWidth: 800),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      _buildResponsiveCategory("Ratones", [
                        "https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?w=400",
                        "https://images.unsplash.com/photo-1615663245857-ac93bb7c39e7?w=400",
                        "https://images.unsplash.com/photo-1586776977607-310e9c725c37?w=400"
                      ]),
                      _buildResponsiveCategory("Teléfonos", [
                        "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=400",
                        "https://images.unsplash.com/photo-1598327105666-5b89351aff97?w=400",
                        "https://images.unsplash.com/photo-1567581935884-3349723552ca?w=400"
                      ]),
                      _buildResponsiveCategory("Audifonos", [
                        "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400",
                        "https://images.unsplash.com/photo-1583394838336-acd977736f90?w=400",
                        "https://images.unsplash.com/photo-1484704849700-f032a568e944?w=400"
                      ]),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab(String label, bool isSelected, Color purpleColor) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: isSelected ? purpleColor : purpleColor.withOpacity(0.4),
          border: Border(
            bottom: BorderSide(
              color: isSelected ? Colors.black87 : Colors.transparent, 
              width: 3
            )
          ),
        ),
        child: Text(
          label, 
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.black45,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildResponsiveCategory(String title, List<String> images) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(title, style: TextStyle(fontSize: 24, color: Colors.black54, fontWeight: FontWeight.bold)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, 
          children: images.map((url) => _buildProductCard(url)).toList(),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildProductCard(String url) {
    return Container(
      width: 110,
      height: 110,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(url, fit: BoxFit.cover),
      ),
    );
  }
}