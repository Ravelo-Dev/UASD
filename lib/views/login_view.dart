import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uasd_app_final/views/forgot_password_view.dart';
import 'package:url_launcher/url_launcher.dart';
import '../viewmodels/login_viewmodel.dart';

class LoginView extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LoginViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('UASD')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Logo de la UASD
            Image.asset(
              'assets/images/logo_uasd.png', // Asegúrate de que la ruta del logo sea correcta
              height: 100, // Ajusta el tamaño del logo según tus necesidades
              width: 100,
            ),
            SizedBox(
                height: 20), // Espaciado entre el logo y los campos de texto
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Usuario'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            if (viewModel.errorMessage.isNotEmpty)
              Text(
                viewModel.errorMessage,
                style: TextStyle(color: Colors.red),
              ),
            SizedBox(height: 20),
            viewModel.isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () {
                      final username = _usernameController.text.trim();
                      final password = _passwordController.text;

                      if (username.isEmpty || password.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  'Usuario y contraseña son obligatorios')),
                        );
                        return;
                      }

                      viewModel.login(
                        context,
                        username,
                        password,
                      );
                    },
                    child: Text('Ingresar'),
                  ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ForgotPasswordView()),
                );
              },
              child: Text('¿Olvidaste tu contraseña?'),
            ),
            TextButton(
              onPressed: () async {
                const url = 'https://www.uasd.edu.do/inscripcion';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'No se pudo abrir $url';
                }
              },
              child: Text('Estudia con nosotros'),
            ),
          ],
        ),
      ),
    );
  }
}
