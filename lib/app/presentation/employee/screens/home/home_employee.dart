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
  HomeEmployee({required this.onToggle});

  // Widget auxiliar para construir Cards de Funcionário
  final List<Map<String, String>> historico = [
    {'data': '22/10', 'produto': 'Arroz', 'tipo': 'Saída', 'quantidade': '5'},
    {
      'data': '21/10',
      'produto': 'Leite',
      'tipo': 'Entrada',
      'quantidade': '10',
    },
    {
      'data': '21/10',
      'produto': 'Papel A4',
      'tipo': 'Saída',
      'quantidade': '20',
    },
    {
      'data': '20/10',
      'produto': 'Arroz',
      'tipo': 'Entrada',
      'quantidade': '50',
    },
    {'data': '20/10', 'produto': 'Caneta', 'tipo': 'Saída', 'quantidade': '2'},
    {
      'data': '19/10',
      'produto': 'Água Sanitária',
      'tipo': 'Entrada',
      'quantidade': '5',
    },
    {'data': '19/10', 'produto': 'Leite', 'tipo': 'Saída', 'quantidade': '1'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // CORREÇÃO: Cor de fundo do Scaffold é onde o Body aparece
      backgroundColor: const Color.fromARGB(255, 20, 20, 20),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton.icon(
                    label: Text('Admin', style: TextStyle(color: Colors.white)),
                    icon: Icon(Icons.swap_horiz, color: Colors.white),
                    onPressed: onToggle,
                  ),
                ],
              ),
              // Área de Ações Rápidas - Título
              Text(
                'Ações Rápidas',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // CORREÇÃO: Cor do texto para branco
                ),
              ),
              SizedBox(height: 12),
              // Os RegisterMovementButton provavelmente gerenciam a cor do texto internamente,
              // mas não há texto fora deles que precise de correção aqui.
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

              SizedBox(height: 30),

              // Área de Consultas - Título
              Text(
                'Consultas',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // CORREÇÃO: Cor do texto para branco
                ),
              ),
              SizedBox(height: 12),

              // O CardActionWidget deve ter sua cor de texto interna ajustada (supondo que seu widget o suporte,
              // mas o texto dentro dele que não é alterado será branco aqui,
              // se a cor padrão dele não for preta)
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

              // Histórico
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(
                    255,
                    35,
                    35,
                    35,
                  ), // Fundo mais claro para os ListTiles
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: historico.length,
                  itemBuilder: (context, index) {
                    final item = historico[index];
                    final isEntrada = item['tipo'] == 'Entrada';
                    final color = isEntrada
                        ? Colors
                              .green
                              .shade400 // Verde um pouco mais claro
                        : Colors.red.shade400; // Vermelho um pouco mais claro

                    return Column(
                      children: [
                        ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 2,
                          ),
                          leading: Icon(
                            isEntrada
                                ? Icons.arrow_downward
                                : Icons.arrow_upward,
                            color: color,
                            size: 20,
                          ),
                          title: Text(
                            '${item['produto']}',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors
                                  .white, // CORREÇÃO: Texto do título branco
                            ),
                          ),
                          subtitle: Text(
                            '${item['data']} | ${item['tipo']}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors
                                  .white70, // CORREÇÃO: Subtítulo branco mais suave
                            ),
                          ),
                          trailing: Text(
                            '${isEntrada ? '+' : '-'}${item['quantidade']}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  color, // Mantém a cor de destaque (verde/vermelho)
                            ),
                          ),
                        ),
                        if (index < historico.length - 1)
                          Divider(
                            height: 1,
                            indent: 16,
                            endIndent: 16,
                            color: Colors
                                .white12, // CORREÇÃO: Cor da linha branca suave
                          ),
                      ],
                    );
                  },
                ),
              ),

              SizedBox(height: 16),

              CardActionWidget(
                icon: Icons.history_toggle_off,
                title: 'Ver todas as movimentações',
                subtitle: 'Acompanhe seus registros de Entrada e Saída.',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HistoricalScreen()),
                  );
                },
              ),
              SizedBox(height: 24), // Espaçamento extra no final
            ],
          ),
        ),
      ),
    );
  }
}
