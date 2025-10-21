import 'package:easy_stock/app/presentation/admin/screens/home/home_admin_screen.dart';
import 'package:easy_stock/app/core/ui/screen/historical_screen.dart';
import 'package:easy_stock/app/presentation/employee/screens/home/home_employee.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  // Tema Global: Usando um esquema de cores moderno e foco no Indigo.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Estoque Fácil',
      theme: ThemeData(
        // Cor primária forte para o Admin, mantendo a identidade
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Color(0xFFF5F5F5),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
          elevation: 4,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.indigo,
            padding: EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      // Inicia com o Wrapper para permitir a troca de tela
      home: Wrapper(),
    );
  }
}

// ---
// 1. WRAPPER (Gerenciador de Estado para Alternância de Perfil)
// ---
class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  // O estado que define qual tela deve ser exibida
  bool isAdmin = true; // Inicia como Admin (pode ser 'false' para Funcionário)

  void _toggleUserType() {
    setState(() {
      isAdmin = !isAdmin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Se for Admin, mostra a HomeAdmin, senão, a HomeFuncionario
      body: isAdmin
          ? HomeAdmin(onToggle: _toggleUserType)
          : HomeEmployee(onToggle: _toggleUserType),
    );
  }
}

// ---
// 2. HOME ADMIN (Dashboard)
// ---

// ---
// 3. TELA DE CADASTRO/CRUD DE PRODUTOS (ADMIN)
// ---

// ---
// 4. HOME FUNCIONÁRIO (Modificada para incluir o botão de alternância)
// ---

// ---
// 5. TELAS AUXILIARES (MovimentacaoScreen, EstoqueScreen, HistoricoScreen)
// ---

class EstoqueScreen extends StatelessWidget {
  final List<Map<String, dynamic>> produtos = [
    {'nome': 'Arroz', 'quantidade': 120, 'unidade': 'unidades'},
    {'nome': 'Leite', 'quantidade': 50, 'unidade': 'litros'},
    {'nome': 'Papel A4', 'quantidade': 200, 'unidade': 'unidades'},
    {'nome': 'Caneanitária', 'quantidade': 15, 'unidade': 'galões'},
  ];

  @override
  Widget build(BuildContext context) {
    // ... CÓDIGO EstoqueScreen original ...
    return Scaffold(
      appBar: AppBar(title: Text('Estoque Atual')),
      body: ListView.separated(
        itemCount: produtos.length,
        separatorBuilder: (context, index) =>
            Divider(height: 1, indent: 16, endIndent: 16),
        itemBuilder: (context, index) {
          final produto = produtos[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
              child: Text(
                '${produto['quantidade']}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            title: Text(produto['nome']),
            subtitle: Text('Unidade: ${produto['unidade']}'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              // Ação para ver detalhes do produto
            },
          );
        },
      ),
    );
  }
}
