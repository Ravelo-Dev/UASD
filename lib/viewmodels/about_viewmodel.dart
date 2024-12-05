import '../models/developer_model.dart';

class AboutViewModel {
  final List<Developer> developers = [
    Developer(
      name: "Marcos M. Ravelo",
      matricula: "2020-1234",
      bio:
          "Estudiante de Ingeniería en Software apasionado por Flutter y el desarrollo móvil.",
      imagePath: "assets/images/img2x2.jpeg", // Ruta local
    ),
    Developer(
      name: " Maycol Lora ",
      matricula: " 2022-1045",
      bio: " Desarrollador de software especializado en el desarrollo movil",
      imagePath: "assets/images/MykeDev.jpg", // Ruta local
    ),  
  ];
}
