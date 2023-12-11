import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  void _login() {
    setState(() {
      _isLoading = true;
    });

    // Validasi email sebelum melakukan autentikasi
    bool isValidEmail = EmailValidator.validate(_emailController.text);

    if (!isValidEmail) {
      setState(() {
        _isLoading = false;
      });
      // Tampilkan pesan bahwa email tidak valid atau lakukan tindakan lainnya
      // Misalnya, menampilkan snackbar dengan pesan kesalahan
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email is not valid.'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    // Lanjutkan ke proses autentikasi jika email valid
    // Simulasi autentikasi (contoh, seharusnya menggunakan metode autentikasi yang sesungguhnya)
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
      Navigator.pushNamed(context, '/login');
      // Jika tidak berhasil, tampilkan pesan error atau lakukan tindakan lainnya
    });
  }

  void _goToRegisterScreen() {
    Navigator.pushNamed(context, '/register');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seller Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 24.0),
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _login,
                      child: const Text('Login'),
                    ),
              const SizedBox(height: 12.0),
              TextButton(
                onPressed: _goToRegisterScreen,
                child: const Text('Daftar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
