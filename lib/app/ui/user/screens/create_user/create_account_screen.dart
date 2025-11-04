import 'package:easy_stock/app/core/config/injection.dart';
import 'package:easy_stock/app/core/ui/components/dialog_feedback.dart';
import 'package:easy_stock/app/ui/user/screens/create_user/cubit/create_user_cubit.dart';
import 'package:easy_stock/app/ui/user/screens/login/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _cubit = getIt<CreateUserCubit>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // Roxo escuro do botão
  static const Color primaryPurple = Color.fromARGB(255, 140, 37, 199);
  // Fundo do Scaffold
  static const Color darkBackground = Color.fromARGB(255, 20, 20, 20);

  // Variável de estado para simular o loading/processamento
  bool _isLoading = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: BlocListener<CreateUserCubit, CreateUserState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            showSnackBarFeedback(
              context: context,
              feedbackType: FeedbackType.error,
              message: state.errorMessage!,
            );
          }

          if (state.user != null) {
            showSnackBarFeedback(
              context: context,
              feedbackType: FeedbackType.success,
              message: 'Usuário criado com sucesso',
            );
          }
        },
        child: BlocBuilder<CreateUserCubit, CreateUserState>(
          builder: (context, state) {
            final isLoading = state.loading;
            return Scaffold(
              backgroundColor: darkBackground,
              appBar: AppBar(
                backgroundColor: darkBackground,
                elevation: 0,
                iconTheme: const IconThemeData(color: Colors.white),
              ),
              body: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 20,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        const Text(
                          'Crie sua conta',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 50),

                        // --- Campo Nome ---
                        TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.name,
                          decoration: _inputDecoration('Nome Completo'),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'O nome é obrigatório.';
                            }
                            return null;
                          },
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 15),

                        // --- Campo Email ---
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: _inputDecoration('Email'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'O email é obrigatório.';
                            }
                            if (!RegExp(
                              r'^[^@]+@[^@]+\.[^@]+',
                            ).hasMatch(value)) {
                              return 'Insira um email válido';
                            }
                            return null;
                          },
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 15),

                        // --- Campo Senha ---
                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: _inputDecoration(
                            'Senha (Mín. 6 caracteres)',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'A senha é obrigatória.';
                            }
                            if (value.length < 6) {
                              return 'A senha deve ter no mínimo 6 caracteres';
                            }
                            return null;
                          },
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 50),

                        // --- Botão de Registro ---
                        ElevatedButton(
                          onPressed: () async {
                            await context.read<CreateUserCubit>().createUser(
                              email: emailController.text,
                              password: passwordController.text,
                              name: nameController.text,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryPurple,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: isLoading
                              ? const SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Text(
                                  'Registrar',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                        const SizedBox(height: 20),

                        // --- Link para Login ---
                        TextButton(
                          onPressed: () {
                            // Implementar navegação de volta para a tela de login
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'Já tem uma conta? Faça login.',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Função auxiliar para o estilo dos TextFields
  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.white54),
      filled: true,
      fillColor: Colors.white.withOpacity(0.08),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: primaryPurple,
          width: 2,
        ), // Borda roxa ao focar
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
    );
  }
}

// ----------------------------------------------------------------------------------
// Exemplo de como rodar (apenas para fins de teste no DartPad/projeto)
// ----------------------------------------------------------------------------------
/* void main() {
  // Você precisaria de um MaterialApp aqui, com um tema dark configurado
  runApp(MaterialApp(
    theme: ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: _CreateAccountScreenState.darkBackground,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.deepPurple,
        brightness: Brightness.dark,
      ).copyWith(
        primary: _CreateAccountScreenState.primaryPurple,
        background: _CreateAccountScreenState.darkBackground,
      ),
    ),
    home: const CreateAccountScreen(),
  ));
}
*/
