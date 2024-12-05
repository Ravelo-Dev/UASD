import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/tasks_viewmodel.dart';

class TasksView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tasksViewModel = Provider.of<TasksViewmodel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Tareas Pendiente - UASD'),
      ),
      body: tasksViewModel.isLoading
          ? Center(child: CircularProgressIndicator())
          : tasksViewModel.errorMessage.isNotEmpty
              ? Center(child: Text(tasksViewModel.errorMessage))
              : ListView.builder(
                  itemCount: tasksViewModel.tasksList.length,
                  itemBuilder: (context, index) {
                    final tasks = tasksViewModel.tasksList[index];
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
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      tasks
                                          .titulo, // Formateado a dos decimales
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text('Descripcion: ${tasks.descripcion}',
                                        style: TextStyle(color: Colors.grey)),
                                    SizedBox(height: 5),
                                    Text(
                                        'Fecha de Vencimiento: ${tasks.fechaVencimiento}',
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
