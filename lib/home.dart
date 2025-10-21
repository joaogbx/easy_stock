import 'package:easy_stock/app/presentation/employee/screens/home/home_employee.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

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

// ---
// 1. WRAPPER (Gerenciador de Estado para Alternância de Perfil)
// O Wrapper não precisa de alterações, pois seu papel é apenas gerenciar o estado
// ---
class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
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

// ---
// 2. WIDGET REUTILIZÁVEL: CustomListItem
// Centralizando a lógica do Card para evitar repetição (DRY)
// ---
class CustomListItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Color iconColor;

  const CustomListItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.iconColor = Colors.indigo,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 1, // Sombra suave
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Ícone com cor personalizada
              Icon(icon, size: 30, color: iconColor),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600, // Levemente mais escuro
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right, size: 24, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}

// ---
// 3. HOME ADMIN (Dashboard) - USANDO O NOVO WIDGET
// ---
class HomeAdmin extends StatelessWidget {
  final VoidCallback onToggle;
  HomeAdmin({required this.onToggle});

  // Função auxiliar para construir Cards de Indicadores (MANTIDA)
  Widget _buildStatCard(
    BuildContext context,
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      // Cálculo para garantir dois cards por linha
      width: (MediaQuery.of(context).size.width / 2) - 24,
      child: Card(
        color: color.withOpacity(0.9),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 30, color: Colors.white),
              SizedBox(height: 8),
              Text(
                value,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 4),
              Text(
                title,
                style: TextStyle(fontSize: 14, color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard Administrativo'),
        centerTitle: false, // Alinhamento à esquerda, mais moderno
        actions: [
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
              // Painel de Resumo
              // ------------------------------------
              Text(
                'Visão Geral do Estoque',
                style: TextStyle(
                  fontSize: 22, // Título maior
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16),
              Wrap(
                spacing: 16.0,
                runSpacing: 16.0,
                children: [
                  _buildStatCard(
                    context,
                    'Produtos em Estoque',
                    '1.245',
                    Icons.inventory_2_outlined, // Ícone mais específico
                    Colors.teal.shade600,
                  ),
                  _buildStatCard(
                    context,
                    'Últimas Saídas (Mês)',
                    '-120',
                    Icons.trending_down,
                    Colors.red,
                  ),
                  _buildStatCard(
                    context,
                    'Itens em Falta',
                    '3',
                    Icons.warning_amber,
                    Colors.orange.shade800,
                  ),
                ],
              ),
              SizedBox(height: 30),

              // ------------------------------------
              // Ações Administrativas - USANDO CustomListItem
              // ------------------------------------
              Text(
                'Ações de Gestão',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),

              // Gerenciar Produtos (CRUD)
              CustomListItem(
                icon: Icons.edit_note, // Ícone de nota/edição
                title: 'Gerenciar Produtos',
                subtitle: 'Adicionar, editar e remover itens e cadastros.',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CadastroProdutoScreen(),
                    ),
                  );
                },
              ),

              // Relatórios Completos
              CustomListItem(
                icon: Icons.analytics_outlined, // Ícone de análise
                title: 'Relatórios e Métricas',
                subtitle:
                    'Visualizar movimentações, filtros avançados e gráficos.',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HistoricoScreen(isAdmin: true),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---
// 4. HOME FUNCIONÁRIO (MODIFICADA para usar o novo widget)
// ---
class HomeFuncionario extends StatelessWidget {
  final VoidCallback onToggle;
  HomeFuncionario({required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Olá, João!'),
        centerTitle: false,
        actions: [
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
                'Registrar Movimentação',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16),

              // Botão de Entrada (Cor verde customizada)
              ElevatedButton.icon(
                icon: Icon(Icons.file_download, size: 28),
                label: Text('REGISTRAR ENTRADA'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade600,
                  minimumSize: Size(double.infinity, 70), // Um pouco menor
                ),
                onPressed: () {},
              ),
              SizedBox(height: 16),

              // Botão de Saída (Cor vermelha customizada)
              ElevatedButton.icon(
                icon: Icon(Icons.file_upload, size: 28),
                label: Text('REGISTRAR SAÍDA'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade600,
                  minimumSize: Size(double.infinity, 70), // Um pouco menor
                ),
                onPressed: () {},
              ),
              SizedBox(height: 30),

              // Área de Consultas - USANDO CustomListItem
              Text(
                'Consultas e Histórico',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),

              // Card para Estoque Atual
              CustomListItem(
                icon: Icons.search,
                title: 'Consultar Estoque Atual',
                subtitle: 'Verifique o saldo de um produto específico.',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EstoqueScreen()),
                  );
                },
              ),

              // --- NOVO: LISTA RÁPIDA DE MOVIMENTAÇÕES ---
              SizedBox(height: 20),
              Text(
                'Últimos Lançamentos',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8),

              HistoricoRapidoWidget(),

              // Card para Acessar o Histórico Completo
              CustomListItem(
                icon: Icons.history,
                title: 'Ver Histórico Completo',
                subtitle: 'Detalhes de todas as entradas e saídas.',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HistoricoScreen(isAdmin: false),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---
// 5. WIDGET: HISTÓRICO RÁPIDO (Mantido, mas com ListTile simplificado)
// ---
class HistoricoRapidoWidget extends StatelessWidget {
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
    final int limite = 7;
    final List<Map<String, String>> listaLimitada = historico
        .take(limite)
        .toList();

    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: listaLimitada.length,
        itemBuilder: (context, index) {
          final item = listaLimitada[index];
          final isEntrada = item['tipo'] == 'Entrada';
          final color = isEntrada ? Colors.green.shade600 : Colors.red.shade600;

          return Column(
            children: [
              ListTile(
                dense: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 2,
                ), // Mais compacto
                leading: Icon(
                  isEntrada
                      ? Icons.arrow_downward
                      : Icons
                            .arrow_upward, // Mudei a direção do ícone para Entrada/Saída
                  color: color,
                  size: 20,
                ),
                title: Text(
                  '${item['produto']}',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                ),
                subtitle: Text(
                  '${item['data']} | ${item['tipo']}',
                  style: TextStyle(fontSize: 12),
                ),
                trailing: Text(
                  '${isEntrada ? '+' : '-'}${item['quantidade']}',
                  style: TextStyle(fontWeight: FontWeight.bold, color: color),
                ),
              ),
              if (index < listaLimitada.length - 1)
                Divider(height: 1, indent: 16, endIndent: 16),
            ],
          );
        },
      ),
    );
  }
}

// ---
// 6. TELAS AUXILIARES (CadastroProdutoScreen, EstoqueScreen, HistoricoScreen)
// As telas auxiliares receberam pequenos ajustes estéticos, mas a funcionalidade principal foi mantida.
// ---

class CadastroProdutoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gerenciar Produtos')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Adicionar Novo Produto',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Nome do Produto',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Unidade de Medida (Ex: Kg, Unidade, Litro)',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton.icon(
                      icon: Icon(Icons.add_circle),
                      label: Text('SALVAR NOVO PRODUTO'),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Produto salvo com sucesso!')),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 40),
            Text(
              'Produtos Cadastrados (Edição/Exclusão)',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  ListTile(
                    title: Text('Arroz'),
                    subtitle: Text('ID: 001 | Unidade: kg'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.indigo),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  Divider(height: 1, indent: 16, endIndent: 16),
                  ListTile(
                    title: Text('Leite'),
                    subtitle: Text('ID: 002 | Unidade: litro'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.indigo),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EstoqueScreen extends StatelessWidget {
  final List<Map<String, dynamic>> produtos = [
    {'nome': 'Arroz', 'quantidade': 120, 'unidade': 'unidades', 'minimo': 100},
    {
      'nome': 'Leite',
      'quantidade': 50,
      'unidade': 'litros',
      'minimo': 60,
    }, // Em falta
    {
      'nome': 'Papel A4',
      'quantidade': 200,
      'unidade': 'unidades',
      'minimo': 50,
    },
    {
      'nome': 'Caneta Esferográfica',
      'quantidade': 45,
      'unidade': 'caixas',
      'minimo': 50,
    }, // Em falta
    {
      'nome': 'Água Sanitária',
      'quantidade': 15,
      'unidade': 'galões',
      'minimo': 10,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Estoque Atual')),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 8),
        itemCount: produtos.length,
        separatorBuilder: (context, index) => Divider(height: 1),
        itemBuilder: (context, index) {
          final produto = produtos[index];
          final emFalta = produto['quantidade'] < produto['minimo'];
          final corFalta = emFalta
              ? Colors.red.shade600
              : Colors.green.shade600;

          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              leading: Container(
                width: 50,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: corFalta.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '${produto['quantidade']}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: corFalta,
                    fontSize: 16,
                  ),
                ),
              ),
              title: Text(
                produto['nome'],
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                'Unidade: ${produto['unidade']} | Mín: ${produto['minimo']}',
              ),
              trailing: emFalta
                  ? Icon(Icons.error_outline, color: Colors.red, size: 24)
                  : Icon(
                      Icons.check_circle_outline,
                      color: Colors.green,
                      size: 24,
                    ),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}

class HistoricoScreen extends StatelessWidget {
  final bool isAdmin;
  HistoricoScreen({required this.isAdmin});

  // Dados de exemplo, mais organizados
  final List<Map<String, String>> historico = [
    {
      'data': '22/10',
      'produto': 'Arroz',
      'tipo': 'Saída',
      'quantidade': '5',
      'usuario': 'João',
    },
    {
      'data': '21/10',
      'produto': 'Leite',
      'tipo': 'Entrada',
      'quantidade': '10',
      'usuario': 'Maria',
    },
    {
      'data': '21/10',
      'produto': 'Papel A4',
      'tipo': 'Saída',
      'quantidade': '20',
      'usuario': 'João',
    },
    {
      'data': '20/10',
      'produto': 'Arroz',
      'tipo': 'Entrada',
      'quantidade': '50',
      'usuario': 'Maria',
    },
    {
      'data': '20/10',
      'produto': 'Caneta',
      'tipo': 'Saída',
      'quantidade': '2',
      'usuario': 'João',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Histórico de Movimentações')),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 8),
        itemCount: historico.length,
        itemBuilder: (context, index) {
          final item = historico[index];
          final isEntrada = item['tipo'] == 'Entrada';
          final color = isEntrada ? Colors.green.shade600 : Colors.red.shade600;

          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              leading: Icon(
                isEntrada ? Icons.arrow_downward : Icons.arrow_upward,
                color: color,
                size: 30,
              ),
              title: Text(
                '${item['produto']}',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              subtitle: Text(
                '${item['data']} - ${item['tipo']} ${isAdmin ? 'por ${item['usuario']}' : ''}',
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${isEntrada ? '+' : '-'}${item['quantidade']}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: color,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Unidades',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// Fim do código refatorado
