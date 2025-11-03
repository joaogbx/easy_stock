import 'package:easy_stock/app/ui/components/appbar_widget.dart';
import 'package:flutter/material.dart';

class StockScreen extends StatelessWidget {
  // Nota: A lista de produtos foi corrigida para conter o nome da unidade 'saneamento'
  final List<Map<String, dynamic>> produtos = [
    {'nome': 'Arroz', 'quantidade': 120, 'unidade': 'unidades'},
    {'nome': 'Leite', 'quantidade': 50, 'unidade': 'litros'},
    {'nome': 'Papel A4', 'quantidade': 200, 'unidade': 'unidades'},
    {'nome': 'Caneanitária', 'quantidade': 15, 'unidade': 'galões'},
  ];

  @override
  Widget build(BuildContext context) {
    // Definindo as cores claras para bom contraste
    const Color textoPrincipal = Colors.white;
    const Color textoSecundario = Colors.white70; // Um branco mais suave

    // A cor primária do tema é usada para o círculo do Leading
    final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppbarWidget(text: 'Estoque atual'),
      // Fundo escuro
      backgroundColor: const Color.fromARGB(255, 20, 20, 20),
      body: ListView.separated(
        itemCount: produtos.length,
        separatorBuilder: (context, index) => const Divider(
          height: 1,
          indent: 16,
          endIndent: 16,
          color: Colors.white12,
        ), // Separador claro
        itemBuilder: (context, index) {
          final produto = produtos[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: primaryColor.withOpacity(
                0.15,
              ), // Fundo do círculo levemente opaco
              child: Text(
                '${produto['quantidade']}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: primaryColor, // Usando a cor primária para destaque
                ),
              ),
            ),
            // Título: Cor branca para destaque
            title: Text(
              produto['nome'],
              style: const TextStyle(color: textoPrincipal),
            ),
            // Subtítulo: Cor branca suave
            subtitle: Text(
              'Unidade: ${produto['unidade']}',
              style: const TextStyle(color: textoSecundario),
            ),
            // Trailing: Ícone claro
            trailing: const Icon(
              Icons.keyboard_arrow_right,
              color: textoSecundario,
            ),
            onTap: () {
              // Ação para ver detalhes do produto
            },
          );
        },
      ),
    );
  }
}
