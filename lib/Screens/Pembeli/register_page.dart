// ignore_for_file: library_private_types_in_public_api, prefer_final_fields, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:uas_ppb_1/Models/users.dart';
import '../../Providers/auth_provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  bool _isObscurePassword = true;
  bool _isObscureConfirmPassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isObscurePassword = !_isObscurePassword;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _isObscureConfirmPassword = !_isObscureConfirmPassword;
    });
  }

  Future<void> _registerSeller(String role) async {
    String name = _nameController.text.trim();
    String address = _addressController.text.trim();
    String phoneNumber = _phoneNumberController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String confirmPassword = _confirmPasswordController.text.trim();

    // Validasi nama
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter your name.'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    // Validasi alamat
    if (address.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter your address.'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    // Validasi nomor telepon
    if (phoneNumber.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter your phone number.'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    } else if (!RegExp(r'^[0-9]+$').hasMatch(phoneNumber)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Phone number should contain only digits.'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    } else if (phoneNumber.length < 10 || phoneNumber.length > 13) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid phone number length.'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    // Validasi email
    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter your email.'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    } else if (!EmailValidator.validate(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid email address.'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    // Validasi password
    if (password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter your password.'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    } else if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Passwords do not match.'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    } else if (!_isPasswordValid(password)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Password must be at least 8 characters, contain at least one uppercase letter, one lowercase letter, and one number.'),
          duration: Duration(seconds: 4),
        ),
      );
      return;
    }

    // Lanjutkan proses registrasi jika semua validasi terpenuhi
    // ...
    final user = UserData(
      email: _emailController.text.toLowerCase(),
      nama: _nameController.text,
      alamat: _addressController.text,
      handphone: _phoneNumberController.text,
      roles: role,
    );
    try {
      await AuthProvider().register(
        user: user,
        password: _passwordController.text,
      );
      Future.delayed(const Duration(seconds: 0), () {
        _dialogBuilder(context);
        setState(() {});
      });
    } catch (e) {
      setState(() {});
    }
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Berhasil'),
          content: const Text('Registrasi berhasil dilakukan'),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Okay'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, '/');
              },
            ),
          ],
        );
      },
    );
  }

  bool _isPasswordValid(String password) {
    if (password.length < 8) {
      return false;
    }

    bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
    bool hasLowercase = password.contains(RegExp(r'[a-z]'));
    bool hasDigits = password.contains(RegExp(r'[0-9]'));

    return hasUppercase && hasLowercase && hasDigits;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: const Color(0xFFDC0000),
          title: Text('Registration Page'),
        ),
        body: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              TabBar(
                tabs: const [
                  Tab(
                    child: Text(
                      "Pembeli",
                      style: TextStyle(color: Color(0xFFDC0000)),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Penjual",
                      style: TextStyle(color: Color(0xFFDC0000)),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    getRegisterForm("Pembeli"),
                    getRegisterForm("Penjual"),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget getRegisterForm(String role) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: ListView(
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Name',
            ),
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: _addressController,
            decoration: InputDecoration(
              labelText: 'Address',
            ),
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: _phoneNumberController,
            decoration: InputDecoration(
              labelText: 'Phone Number',
            ),
            keyboardType: TextInputType.phone,
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: _passwordController,
            obscureText: _isObscurePassword,
            decoration: InputDecoration(
              labelText: 'Password',
              suffixIcon: IconButton(
                icon: Icon(_isObscurePassword
                    ? Icons.visibility
                    : Icons.visibility_off),
                onPressed: _togglePasswordVisibility,
              ),
            ),
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: _confirmPasswordController,
            obscureText: _isObscureConfirmPassword,
            decoration: InputDecoration(
              labelText: 'Confirm Password',
              suffixIcon: IconButton(
                icon: Icon(_isObscureConfirmPassword
                    ? Icons.visibility
                    : Icons.visibility_off),
                onPressed: _toggleConfirmPasswordVisibility,
              ),
            ),
          ),
          SizedBox(height: 24.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFDC0000),
            ),
            onPressed: () => _registerSeller(role),
            child: Text('Register $role'),
          ),
        ],
      ),
    );
  }
}
