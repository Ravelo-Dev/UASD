import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/request_viewmodel.dart';

class SolicitudesView extends StatefulWidget {
  @override
  _SolicitudesViewState createState() => _SolicitudesViewState();
}

class _SolicitudesViewState extends State<SolicitudesView> {
  String? tipoSeleccionado;
  final TextEditingController descripcionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel =
          Provider.of<SolicitudesViewModel>(context, listen: false);
      viewModel.cargarTiposSolicitudes();
      viewModel.cargarMisSolicitudes();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SolicitudesViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Solicitudes')),
      body: viewModel.isLoading
          ? Center(
              child:
                  CircularProgressIndicator()) // Muestra el indicador de carga
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Formulario para crear solicitudes
                  DropdownButtonFormField<String>(
                    items: viewModel.tiposSolicitudes
                        .map((tipo) => DropdownMenuItem<String>(
                              value: tipo.codigo,
                              child: Text(tipo.descripcion),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        tipoSeleccionado = value;
                      });
                    },
                    value: tipoSeleccionado,
                    hint: Text('Selecciona un tipo de solicitud'),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Tipo de Solicitud',
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: descripcionController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Descripción',
                      hintText: 'Escribe una breve descripción',
                    ),
                    maxLines: 3,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      if (tipoSeleccionado == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Selecciona un tipo de solicitud.'),
                          ),
                        );
                        return;
                      }
                      if (descripcionController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Escribe una descripción.'),
                          ),
                        );
                        return;
                      }
                      try {
                        await viewModel.crearSolicitud(
                          tipoSeleccionado!,
                          descripcionController.text,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Solicitud creada con éxito.')),
                        );
                        descripcionController.clear();
                        setState(() {
                          tipoSeleccionado = null;
                        });
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Error al crear la solicitud.')),
                        );
                      }
                    },
                    child: Text('Crear Solicitud'),
                  ),
                  SizedBox(height: 32),
                  // Lista de solicitudes
                  Expanded(
                    child: viewModel.misSolicitudes.isEmpty
                        ? Center(
                            child: Text('No hay solicitudes registradas.'),
                          )
                        : ListView.builder(
                            itemCount: viewModel.misSolicitudes.length,
                            itemBuilder: (context, index) {
                              final solicitud = viewModel.misSolicitudes[index];
                              return Card(
                                margin: EdgeInsets.symmetric(vertical: 8),
                                child: ListTile(
                                  title: Text(
                                    solicitud.tipo,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(solicitud.descripcion),
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
