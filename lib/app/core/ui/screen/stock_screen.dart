import 'package:flutter/material.dart';

class StockScreen extends StatelessWidget {
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
