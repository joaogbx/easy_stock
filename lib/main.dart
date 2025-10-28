import 'package:easy_stock/app/presentation/admin/home/home_admin_screen.dart';
import 'package:easy_stock/app/presentation/employee/home/home_employee.dart';
import 'package:flutter/material.dart';

void main() {
  // O ponto de entrada real do FlutterFlow/App Flutter
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Estoque Fácil',
      // Design mais limpo e profissional
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Color(0xFFF5F5F5), // Cinza muito claro
        fontFamily: 'Roboto', // Fonte padrão clara
        appBarTheme: AppBarTheme(
          backgroundColor:
              Colors.indigo.shade700, // Indigo mais escuro para o appbar
          foregroundColor: Colors.white,
          elevation: 0, // Sem sombra para um design mais flat
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.indigo,
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            elevation: 2,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Color.fromRGBO(
            255,
            255,
            255,
            0.08,
          ), // Fundo suave para o campo
          hintStyle: TextStyle(color: Colors.white70),

          // Configurações para REMOVER o Underline/Linha Inferior Padrão:
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide.none, // Remove a borda padrão
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide
                .none, // Garante que a borda de foco também seja invisível
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide:
                BorderSide.none, // Garante que a borda ativada seja invisível
          ),

          contentPadding: EdgeInsets.symmetric(
            vertical: 18.0,
            horizontal: 15.0,
          ),
        ),

        // 2. Configuração da cor do CURSOR (Ponteiro)
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors
              .white, // Define a cor do cursor (ponteiro de texto) como branco
          selectionColor: Colors.white30, // Cor de seleção de texto
          selectionHandleColor: Colors.white, // Cor do puxador de seleção
        ),
      ),
      home: Wrapper(),
    );
  }
}

class Wrapper extends StatefulWidget {
  @override
  createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  // Alterado para iniciar como Funcionário para fins de teste rápido
  bool isAdmin = false;

  void _toggleUserType() {
    setState(() {
      isAdmin = !isAdmin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isAdmin
          ? HomeAdmin(onToggle: _toggleUserType)
          : HomeEmployee(onToggle: _toggleUserType),
    );
  }
}
