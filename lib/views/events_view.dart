import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uasd_app_final/viewmodels/events_viewmodel.dart';

class EventsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final eventsViewModel = Provider.of<EventsViewmodel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Eventos - UASD'),
      ),
      body: eventsViewModel.isLoading
          ? Center(child: CircularProgressIndicator())
          : eventsViewModel.errorMessage.isNotEmpty
              ? Center(child: Text(eventsViewModel.errorMessage))
              : ListView.builder(
                  itemCount: eventsViewModel.eventsList.length,
                  itemBuilder: (context, index) {
                    final events = eventsViewModel.eventsList[index];
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
                                      events.titulo,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    SizedBox(height: 5),
                                    Text(events.descripcion,
                                        style: TextStyle(fontSize: 14)),
                                    SizedBox(height: 5),
                                    Text('Horario: ${events.fechaEvento}',
                                        style: TextStyle(color: Colors.grey)),
                                    Text('Aula: ${events.lugar}',
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
