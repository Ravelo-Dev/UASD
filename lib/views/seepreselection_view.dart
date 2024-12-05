import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/seepreselection_viewmodel.dart';

class PreselectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final seepreselectionViewmodel =
        Provider.of<SeepreselectionViewmodel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Materias Preseleccionadas - UASD'),
      ),
      body: seepreselectionViewmodel.isLoading
          ? Center(child: CircularProgressIndicator())
          : seepreselectionViewmodel.errorMessage.isNotEmpty
              ? Center(child: Text(seepreselectionViewmodel.errorMessage))
              : ListView.builder(
                  itemCount: seepreselectionViewmodel.preselectionList.length,
                  itemBuilder: (context, index) {
                    final preselection =
                        seepreselectionViewmodel.preselectionList[index];
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
                                      preselection.codigo,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    SizedBox(height: 5),
                                    Text(preselection.nombre,
                                        style: TextStyle(fontSize: 14)),
                                    SizedBox(height: 5),
                                    Text('Aula: ${preselection.aula}',
                                        style: TextStyle(color: Colors.grey)),
                                    Text('Ubicación: ${preselection.ubicacion}',
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
