import 'package:easy_stock/app/presentation/admin/screens/home/home_admin_screen.dart';
import 'package:easy_stock/app/presentation/employee/screens/home/home_employee.dart';
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
