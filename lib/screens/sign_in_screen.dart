import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart'; // Jangan lupa import ini untuk TapGestureRecognizer
import 'package:provider/provider.dart'; // <-- Jangan lupa import provider
import 'package:wisata_candi_joacquine/providers/auth_provider.dart'; // <-- Sesuaikan dengan path AuthProvider Anda

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // TODO 1 Deklarasi variabel
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final String _errorText = '';
  final bool _isSignedin = false;
  bool _obscurePassword = true; // Diubah agar bisa diubah nilainya oleh setState

  // Fungsi _signIn diletakkan di dalam State class agar bisa mengakses controller & context
  void _signIn() {
    final name = _usernameController.text.trim();
    if (name.isEmpty) return;
    context.read<AuthProvider>().signIn(name);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // todo 2 Pasang AppBar
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      // todo 3 pasang body (Ditambahkan SingleChildScrollView agar tidak overflow saat keyboard muncul)
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              child: Column(
                // TODO 4 Atur alignment
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // TODO: 5. TextFormField nama pengguna
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Nama Pengguna',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  // TODO: 6. TextFormField kata sandi
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      labelText: 'Kata Sandi',
                      errorText: _errorText.isNotEmpty ? _errorText : null,
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          // Ditambahkan setState dari PPT untuk mengubah visibility password
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        icon: Icon(_obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // TODO: 7. ElevatedButton Sign In (Menghubungkan fungsi _signIn)
                  ElevatedButton(
                    onPressed: _signIn,
                    child: const Text('Sign In'),
                  ),
                  const SizedBox(height: 10),
                  // TODO: 8. TextButton Sign Up (Diganti dengan RichText)
                  RichText(
                    text: TextSpan(
                      text: 'Belum punya akun? ',
                      style: const TextStyle(fontSize: 16, color: Colors.deepPurple),
                      children: [
                        TextSpan(
                          text: 'Daftar di sini.',
                          style: const TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {
                            // Aksi ketika teks "Daftar di sini." diklik
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}