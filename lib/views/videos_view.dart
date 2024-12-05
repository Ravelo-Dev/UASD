import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/videos_viewmodel.dart';
import 'package:url_launcher/url_launcher.dart';

class VideosView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<VideosViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Videos Educativos - UASD')),
      body: viewModel.isLoading
          ? Center(child: CircularProgressIndicator())
          : viewModel.errorMessage.isNotEmpty
              ? Center(child: Text(viewModel.errorMessage))
              : ListView.builder(
                  itemCount: viewModel.videos.length,
                  itemBuilder: (context, index) {
                    final video = viewModel.videos[index];
                    return ListTile(
                      title: Text(video.titulo),
                      subtitle: Text(
                        'Publicado el ${video.fechaPublicacion}',
                      ),
                      trailing: Icon(Icons.play_arrow),
                      onTap: () async {
                        final url =
                            'https://www.youtube.com/watch?v=${video.url}';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('No se pudo abrir el video')),
                          );
                        }
                      },
                    );
                  },
                ),
    );
  }
}
