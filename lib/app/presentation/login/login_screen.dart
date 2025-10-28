import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 20, 20, 20),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 10),
            // Título "Opal"
            const Text(
              'Opal',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 40, // Um pouco maior para ser proeminente
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            // Título "Welcome back"
            Text(
              'Welcome back',
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 5),
            // Subtítulo
            Text(
              "Let's get you in to Opal",
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 30),
            // Campo de Email
            const TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(hintText: 'Your Email'),
            ),
            const SizedBox(height: 15),
            // Campo de Senha
            const TextField(
              obscureText: true,
              decoration: InputDecoration(hintText: 'Your Password'),
            ),
            const SizedBox(height: 15),
            // Botão "Forgot password?"
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Ação de esqueci a senha
                },
                child: const Text(
                  'Forgot password?',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Botão "Sign in"
            ElevatedButton(
              onPressed: () {
                // Ação de login com email/senha
              },
              style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 140, 37, 199),
                ),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
              child: const Text(
                'Sign in',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 25),
            // Separador "or"
            const Center(
              child: Text(
                'or',
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
            ),
            const SizedBox(height: 25),
            // Botão "Sign In With Apple"
            ElevatedButton.icon(
              onPressed: () {
                // Ação de login com Apple
              },
              icon: const Icon(Icons.apple, color: Colors.white, size: 28),
              label: const Text('Sign In With Apple'),
              style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromRGBO(50, 50, 50, 1.0),
                ), // Fundo escuro
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
            ),
            const SizedBox(height: 15),
            // Botão "Sign In With Phone"
            ElevatedButton.icon(
              onPressed: () {
                // Ação de login com telefone
              },
              icon: const Icon(Icons.phone, color: Colors.white, size: 24),
              label: const Text('Sign In With Phone'),
              style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromRGBO(50, 50, 50, 1.0),
                ), // Fundo escuro
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
            ),
            const SizedBox(height: 40),
            // Texto "Don't have an account?"
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
                TextButton(
                  onPressed: () {
                    // Ação de registro/signup
                  },
                  // O texto não tem um TextButton explícito na imagem, mas o layout
                  // sugere uma área clicável. Vou manter como um TextButton invisível.
                  // Se for para ser idêntico, o código abaixo pode ser removido,
                  // mas para UX é melhor um botão.
                  child: const Text(
                    // Se for para ser *exatamente* igual à imagem:
                    // '?' é o fim da frase. Não tem 'Sign up' na imagem.
                    '',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
