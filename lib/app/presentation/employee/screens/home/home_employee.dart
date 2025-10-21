import 'package:easy_stock/app/core/ui/components/card_action_widget.dart';
import 'package:easy_stock/app/core/ui/components/register_movement_button.dart';
import 'package:easy_stock/app/core/enums/register_mode.dart';
import 'package:easy_stock/app/core/ui/screen/historical_screen.dart';
import 'package:easy_stock/app/presentation/employee/screens/register_movement/register_movement.dart';
import 'package:easy_stock/app/core/ui/screen/stock_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeEmployee extends StatelessWidget {
  final VoidCallback onToggle;
  const HomeEmployee({required this.onToggle});

  // Widget auxiliar para construir Cards de Funcionário

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bem-vindo, João (Funcionário)!'),
        centerTitle: true,
        actions: [
          // Botão de Alternância
          TextButton.icon(
            label: Text('Admin', style: TextStyle(color: Colors.white)),
            icon: Icon(Icons.swap_horiz, color: Colors.white),
            onPressed: onToggle,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Área de Ações Rápidas - Destacadas
              Text(
                'Ações Rápidas',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 12),
              // Botão de Entrada
              RegisterMovementButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          RegisterMovement(registerMode: RegisterMode.stockIn),
                    ),
                  );
                },
                registerMode: RegisterMode.stockIn,
              ),
              SizedBox(height: 12),
              RegisterMovementButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          RegisterMovement(registerMode: RegisterMode.stockOut),
                    ),
                  );
                },
                registerMode: RegisterMode.stockOut,
              ),

              // Botão de Saída
              SizedBox(height: 30),

              // Área de Consultas - Usando Cards
              Text(
                'Consultas',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 12),

              CardActionWidget(
                icon: Icons.inventory_2_outlined,
                title: 'Estoque Atual',
                subtitle: 'Visualize o saldo de todos os produtos.',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StockScreen()),
                  );
                },
              ),

              // Card para Estoque Atual
              SizedBox(height: 16),

              CardActionWidget(
                icon: Icons.history_toggle_off,
                title: 'Minhas Movimentações',
                subtitle: 'Acompanhe seus registros de Entrada e Saída.',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HistoricalScreen()),
                  );
                },
              ), // Card para Histórico
            ],
          ),
        ),
      ),
    );
  }
}
