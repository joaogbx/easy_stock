import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoricalScreen extends StatelessWidget {
  final List<Map<String, String>> historico = [
    {
      'data': '20/10',
      'produto': 'Arroz',
      'tipo': 'Entrada',
      'quantidade': '50',
      'cor': 'green',
    },
    {
      'data': '21/10',
      'produto': 'Papel A4',
      'tipo': 'Saída',
      'quantidade': '20',
      'cor': 'red',
    },
    {
      'data': '21/10',
      'produto': 'Leite',
      'tipo': 'Entrada',
      'quantidade': '10',
      'cor': 'green',
    },
    {
      'data': '22/10',
      'produto': 'Arroz',
      'tipo': 'Saída',
      'quantidade': '5',
      'cor': 'red',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // ... CÓDIGO HistoricoScreen original ...
    return Scaffold(
      appBar: AppBar(title: Text('Minhas Movimentações')),
      body: ListView.separated(
        itemCount: historico.length,
        separatorBuilder: (context, index) =>
            Divider(height: 1, indent: 16, endIndent: 16),
        itemBuilder: (context, index) {
          final item = historico[index];
          final isEntrada = item['tipo'] == 'Entrada';
          final color = isEntrada ? Colors.green : Colors.redAccent;

          return ListTile(
            leading: Icon(
              isEntrada ? Icons.arrow_upward : Icons.arrow_downward,
              color: color,
              size: 28,
            ),
            title: Text(
              '${item['produto']} (${item['tipo']})',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Data: ${item['data']} | Quantidade: ${item['quantidade']}',
            ),
            trailing: Text(
              '${isEntrada ? '+' : '-'}${item['quantidade']}',
              style: TextStyle(fontWeight: FontWeight.bold, color: color),
            ),
          );
        },
      ),
    );
  }
}
