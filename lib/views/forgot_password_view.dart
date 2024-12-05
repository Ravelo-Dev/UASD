import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class ForgotPasswordView extends StatefulWidget {
  @override
  _ForgotPasswordViewState createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool isLoading = false;
  String message = ''; // Para mostrar mensajes al usuario

  void resetPassword() async {
    setState(() {
      isLoading = true;
      message = '';
    });
    try {
      final successMessage = await AuthService().resetPassword(
        _usernameController.text,
        _emailController.text,
      );
      setState(() => message = successMessage); // Mostrar mensaje de éxito
    } catch (e) {
      setState(() => message = 'Error: ${e.toString()}'); // Mostrar error
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recuperar Contraseña')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Usuario'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Correo Electrónico'),
            ),
            SizedBox(height: 20),
            if (isLoading) CircularProgressIndicator(),
            if (message.isNotEmpty)
              Text(
                message,
                style: TextStyle(
                  color: message.contains('Error') ? Colors.red : Colors.green,
                ),
                textAlign: TextAlign.center,
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: resetPassword,
              child: Text('Restablecer Contraseña'),
            ),
          ],
        ),
      ),
    );
  }
}
