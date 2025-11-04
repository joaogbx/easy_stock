import 'package:easy_stock/app/core/ui/components/card_action_widget.dart';
import 'package:easy_stock/app/core/ui/components/register_movement_button.dart';
import 'package:easy_stock/app/core/enums/register_mode.dart';
import 'package:easy_stock/app/core/ui/screen/historical_screen.dart';
import 'package:easy_stock/app/ui/config/config_bottom_sheet.dart';
import 'package:easy_stock/app/ui/employee/register_movement/register_movement.dart';
import 'package:easy_stock/app/core/ui/screen/stock_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeEmployee extends StatelessWidget {
  final Function() onToggle;
  HomeEmployee({super.key, required this.onToggle});

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
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // CORREÇÃO: Cor de fundo do Scaffold é onde o Body aparece
      backgroundColor: const Color.fromARGB(255, 20, 20, 20),
      body: RefreshIndicator(
        color: const Color.fromARGB(255, 83, 22, 119),
        // Cor do círculo de progresso
        backgroundColor: const Color.fromARGB(
          255,
          31,
          31,
          31,
        ), // Fundo do círculo
        displacement: 40, // Distância do topo onde o círculo aparece
        strokeWidth: 3,
        onRefresh: () async {},
        child: SingleChildScrollView(
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
                      label: Text(
                        'Admin',
                        style: TextStyle(color: Colors.white),
                      ),
                      icon: Icon(Icons.swap_horiz, color: Colors.white),
                      onPressed: onToggle,
                    ),
                  ],
                ),

                Stack(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(radius: 40),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nome do usuario',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                              ),
                            ),
                            Text(
                              'Funcionario',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: Icon(Icons.settings, color: Colors.white),
                        onPressed: () {
                          showModalBottomSheet(
                            backgroundColor: const Color.fromARGB(
                              255,
                              20,
                              20,
                              20,
                            ),
                            context: context,
                            builder: (context) {
                              return SettingsScreenOption2();
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
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
                        builder: (context) => RegisterMovement(
                          registerMode: RegisterMode.stockIn,
                        ),
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
                        builder: (context) => RegisterMovement(
                          registerMode: RegisterMode.stockOut,
                        ),
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
                    padding: EdgeInsets.all(0),
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
                      MaterialPageRoute(
                        builder: (context) => HistoricalScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 24), // Espaçamento extra no final
              ],
            ),
          ),
        ),
      ),
    );
  }
}
