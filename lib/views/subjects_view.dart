import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/subjects_viewmodel.dart';

class SubjectsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final subjectsViewModel = Provider.of<SubjectsViewmodel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Materias - UASD'),
      ),
      body: subjectsViewModel.isLoading
          ? Center(child: CircularProgressIndicator())
          : subjectsViewModel.errorMessage.isNotEmpty
              ? Center(child: Text(subjectsViewModel.errorMessage))
              : ListView.builder(
                  itemCount: subjectsViewModel.subjectsList.length,
                  itemBuilder: (context, index) {
                    final subjects = subjectsViewModel.subjectsList[index];
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(width: 15),
                              // Información de la noticia
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      subjects.codigo,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    SizedBox(height: 5),
                                    Text(subjects.nombre,
                                        style: TextStyle(fontSize: 14)),
                                    SizedBox(height: 5),
                                    Text('Horario: ${subjects.horario}',
                                        style: TextStyle(color: Colors.grey)),
                                    Text('Aula: ${subjects.aula}',
                                        style: TextStyle(color: Colors.grey)),
                                    Text('Ubicación: ${subjects.ubicacion}',
                                        style: TextStyle(color: Colors.grey)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
