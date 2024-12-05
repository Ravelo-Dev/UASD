import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uasd_app_final/viewmodels/debts_viewmodel.dart';
import 'package:uasd_app_final/viewmodels/events_viewmodel.dart';
import 'package:uasd_app_final/viewmodels/seepreselection_viewmodel.dart';
import 'package:uasd_app_final/viewmodels/subjects_viewmodel.dart';
import 'package:uasd_app_final/viewmodels/videos_viewmodel.dart';
import 'package:uasd_app_final/views/about_view.dart';
import 'package:uasd_app_final/views/debts_view.dart';
import 'package:uasd_app_final/views/events_view.dart';
import 'package:uasd_app_final/views/seepreselection_view.dart';
import 'package:uasd_app_final/views/subjects_view.dart';
import 'package:uasd_app_final/views/videos_view.dart';
import '../viewmodels/tasks_viewmodel.dart';
import '../views/news_view.dart';
import '../services/auth_service.dart';
import '../views/login_view.dart';
import '../viewmodels/news_viewmodel.dart';
import '../views/request_view.dart'; // Importa la vista de solicitudes
import '../viewmodels/request_viewmodel.dart';
import 'tasks_view.dart'; // Importa el ViewModel de solicitudes

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menú Principal - UASD')),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.article),
            title: Text('Noticias'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider(
                          create: (_) => NewsViewModel()..loadNews(),
                          child: NewsView(),
                        )),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Mis Materias'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider(
                          create: (_) => SubjectsViewmodel()..loadSubjects(),
                          child: SubjectsView(),
                        )),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.check_circle_outline),
            title: Text('Preselección'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider(
                          create: (_) =>
                              SeepreselectionViewmodel()..loadPreselection(),
                          child: PreselectionView(),
                        )),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.attach_money),
            title: Text('Deuda'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider(
                          create: (_) => DebtsViewmodel()..loadDebts(),
                          child: DebtsView(),
                        )),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.pending_actions),
            title: Text('Solicitudes'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider(
                          create: (_) => SolicitudesViewModel()
                            ..cargarTiposSolicitudes()
                            ..cargarMisSolicitudes(),
                          child: SolicitudesView(),
                        )),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.assignment),
            title: Text('Mis Tareas'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider(
                          create: (_) => TasksViewmodel()..loadTasks(),
                          child: TasksView(),
                        )),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.event),
            title: Text('Eventos'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider(
                          create: (_) => EventsViewmodel()..loadEvents(),
                          child: EventsView(),
                        )),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.video_library),
            title: Text('Videos'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChangeNotifierProvider(
                    create: (_) => VideosViewModel()..loadVideos(),
                    child: VideosView(),
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Acerca de'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutView()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Salir'),
            onTap: () async {
              await AuthService().logout();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => LoginView()),
              );
            },
          ),
        ],
      ),
    );
  }
}
