import 'package:flutter/material.dart';
import '../viewmodels/about_viewmodel.dart';

class AboutView extends StatelessWidget {
  final AboutViewModel viewModel = AboutViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Desarrolladores')),
      body: ListView.builder(
        itemCount: viewModel.developers.length,
        itemBuilder: (context, index) {
          final developer = viewModel.developers[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(developer.imagePath),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          developer.name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Matrícula: ${developer.matricula}",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        SizedBox(height: 10),
                        Text(
                          developer.bio,
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
