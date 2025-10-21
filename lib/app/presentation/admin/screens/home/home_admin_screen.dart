import 'package:easy_stock/app/presentation/admin/screens/home/components/stat_card.dart';
import 'package:easy_stock/app/presentation/admin/screens/product_management/product_management_screen.dart';
import 'package:easy_stock/app/core/ui/components/card_action_widget.dart';
import 'package:easy_stock/app/core/ui/screen/historical_screen.dart';
import 'package:easy_stock/home.dart';
import 'package:flutter/material.dart';

class HomeAdmin extends StatelessWidget {
  final VoidCallback onToggle;
  const HomeAdmin({super.key, required this.onToggle});

  // Função auxiliar para construir Cards de Admin

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard Admin'),
        centerTitle: true,
        actions: [
          // Botão de Alternância
          TextButton.icon(
            label: Text('Funcionário', style: TextStyle(color: Colors.white)),
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
              // ------------------------------------
              // Painel de Resumo (Simulação de Indicadores)
              // ------------------------------------
              Text(
                'Resumo Geral',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 12),
              Wrap(
                alignment: WrapAlignment.start,
                spacing: 16.0, // Espaço horizontal entre os cards
                runSpacing: 16.0, // Espaço vertical entre as linhas
                children: [
                  // Simulação de Card de Indicador 1
                  StatCard(
                    title: 'Total de Itens',
                    value: '1.245',
                    icon: Icons.storage,
                    color: Colors.teal,
                  ),
                  StatCard(
                    title: 'Último Mês',
                    value: '+120 Saídas',
                    icon: Icons.trending_down,
                    color: Colors.red,
                  ),
                  StatCard(
                    title: 'Produtos Cad.',
                    value: '45',
                    icon: Icons.category,
                    color: Colors.indigo,
                  ),
                ],
              ),
              SizedBox(height: 30),

              // ------------------------------------
              // Ações Administrativas
              // ------------------------------------
              Text(
                'Gestão e Relatórios',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 12),
              CardActionWidget(
                icon: Icons.add_business,
                title: 'Gerenciar Produtos',
                subtitle: 'Adicionar, editar e remover itens.',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductManagementScreen(),
                    ),
                  );
                },
              ),
              CardActionWidget(
                icon: Icons.bar_chart,
                title: 'Relatório Completo',
                subtitle: 'Visualizar todas as movimentações e filtros.',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HistoricalScreen()),
                  );
                },
              ),

              SizedBox(height: 16),

              // Card para Relatórios Completos
            ],
          ),
        ),
      ),
    );
  }

  // Widget _buildStatCard(
  //   BuildContext context,
  //   String title,
  //   String value,
  //   IconData icon,
  //   Color color,
  // ) {}
}
