import 'package:flutter/material.dart';
import 'login_view.dart';

class LandingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Imagen en el header
          Container(
            width: double.infinity,
            height: 200, // Altura del header
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Contenido principal
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Información de la UASD
                  Column(
                    children: [
                      Text(
                        'Universidad Autónoma de Santo Domingo',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      SizedBox(height: 10),
                      Text(
                        'SOBRE LA UASD',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // Misión, visión y valores
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _buildSection(
                            title: 'UASD',
                            content:
                                'La Universidad de Santo Domingo fue creada mediante la Bula In Apostolatus Culmine, expedida el 28 de octubre de 1538 por el Papa Paulo III, la cual elevó a esa categoría el Estudio General que los dominicos regenteaban desde el 1518, en Santo Domingo, sede virreinal de la colonización y el más viejo establecimiento colonial del Nuevo Mundo. La naciente Universidad inició sus enseñanzas organizadas en cuatro Facultades: Medicina, Derecho, Teología y Artes, conforme a las normas establecidas en la época para las instituciones similares de la metrópoli. Los estudios de Artes incluían dos modalidades, a saber: el “trivium” que comprendía la Gramática, la Retórica y la Lógica y el “quadrivium”, que englobaba la Aritmética, Geometría, Astronomía y Música.',
                          ),
                          _buildSection(
                            title: 'Misión',
                            content:
                                'Su Misión es formar críticamente profesionales, investigadores y técnicos en las ciencias, las humanidades y las artes necesarias y eficientes para coadyuvar a las transformaciones que demanda el desarrollo nacional sostenible, así como difundir los ideales de la cultura de paz, progreso, justicia social, equidad de género y respeto a los derechos humanos, a fin de contribuir a la formación de una conciencia colectiva basada en valores.',
                          ),
                          _buildSection(
                            title: 'Visión',
                            content:
                                'La Universidad tiene como Visión ser una institución de excelencia y liderazgo académico, gestionada con eficiencia y acreditada nacional e internacionalmente; con un personal docente, investigador, extensionistas y egresados de alta calificación; creadora de conocimientos científicos y nuevas tecnologías, y reconocida por su contribución al desarrollo humano con equidad y hacia una sociedad democrática y solidaria.',
                          ),
                          _buildSection(
                            title: 'Valores',
                            content:
                                'Solidaridad, Transparencia, Verdad, Igualdad, Libertad, Equidad, Tolerancia, Responsabilidad',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Botón para ingresar
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginView()),
                      );
                    },
                    child: Text('Ingresar a la aplicación'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 12.0),
                      textStyle: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget para secciones
  Widget _buildSection({required String title, required String content}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Text(
            content,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
