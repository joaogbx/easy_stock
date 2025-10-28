import 'package:easy_stock/app/presentation/components/appbar_widget.dart';
import 'package:flutter/material.dart';

class ProductManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Definindo as cores para o tema escuro e roxo, seguindo o padrão HomeAdmin
    final Color primaryColor = Colors.deepPurple.shade400; // Roxo principal
    final Color accentColor = Colors.deepPurple.shade300; // Roxo de destaque
    final Color backgroundColor = const Color.fromARGB(
      255,
      20,
      20,
      20,
    ); // Fundo muito escuro
    final Color cardColor = const Color.fromARGB(
      255,
      30,
      30,
      30,
    ); // Fundo dos cards de ação (sutilmente mais claro)
    final Color textColor = Colors.white; // Cor padrão do texto

    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: AppbarWidget(text: 'Gerenciar Produtos'),

      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Título da Lista de Produtos
                  Text(
                    'Produtos Cadastrados (Ação de Edição/Exclusão)',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: accentColor, // Destaque roxo para o título
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Simulação de Lista de Produtos Existentes
                  Column(
                    children: [
                      _buildProductTile(
                        context,
                        'Arroz',
                        'ID: 001 | Unidade: kg',
                        primaryColor,
                        textColor,
                        accentColor,
                      ),
                      _buildProductTile(
                        context,
                        'Arroz',
                        'ID: 001 | Unidade: kg',
                        primaryColor,
                        textColor,
                        accentColor,
                      ),
                      _buildProductTile(
                        context,
                        'Arroz',
                        'ID: 001 | Unidade: kg',
                        primaryColor,
                        textColor,
                        accentColor,
                      ),
                      _buildProductTile(
                        context,
                        'Arroz',
                        'ID: 001 | Unidade: kg',
                        primaryColor,
                        textColor,
                        accentColor,
                      ),
                      _buildProductTile(
                        context,
                        'Arroz',
                        'ID: 001 | Unidade: kg',
                        primaryColor,
                        textColor,
                        accentColor,
                      ),
                      _buildProductTile(
                        context,
                        'Arroz',
                        'ID: 001 | Unidade: kg',
                        primaryColor,
                        textColor,
                        accentColor,
                      ),
                      _buildProductTile(
                        context,
                        'Arroz',
                        'ID: 001 | Unidade: kg',
                        primaryColor,
                        textColor,
                        accentColor,
                      ),
                      _buildProductTile(
                        context,
                        'Arroz',
                        'ID: 001 | Unidade: kg',
                        primaryColor,
                        textColor,
                        accentColor,
                      ),
                      _buildProductTile(
                        context,
                        'Arroz',
                        'ID: 001 | Unidade: kg',
                        primaryColor,
                        textColor,
                        accentColor,
                      ),
                      _buildProductTile(
                        context,
                        'Arroz',
                        'ID: 001 | Unidade: kg',
                        primaryColor,
                        textColor,
                        accentColor,
                      ),
                      _buildProductTile(
                        context,
                        'Arroz',
                        'ID: 001 | Unidade: kg',
                        primaryColor,
                        textColor,
                        accentColor,
                      ),
                      _buildProductTile(
                        context,
                        'Arroz',
                        'ID: 001 | Unidade: kg',
                        primaryColor,
                        textColor,
                        accentColor,
                      ),
                      _buildProductTile(
                        context,
                        'Arroz',
                        'ID: 001 | Unidade: kg',
                        primaryColor,
                        textColor,
                        accentColor,
                      ),
                      _buildProductTile(
                        context,
                        'Arroz',
                        'ID: 001 | Unidade: kg',
                        primaryColor,
                        textColor,
                        accentColor,
                      ),
                      _buildProductTile(
                        context,
                        'Arroz',
                        'ID: 001 | Unidade: kg',
                        primaryColor,
                        textColor,
                        accentColor,
                      ),
                      // Separador sutil
                      _buildProductTile(
                        context,
                        'Leite',
                        'ID: 002 | Unidade: litro',
                        primaryColor,
                        textColor,
                        accentColor,
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // Simulação de Formulário de Adição
                  //Card(
                  //  elevation: 4,
                  //  color: cardColor, // Fundo escuro sutil
                  //  shape: RoundedRectangleBorder(
                  //    borderRadius: BorderRadius.circular(10),
                  //  ),
                  //  child: Padding(
                  //    padding: const EdgeInsets.all(16.0),
                  //    child: Column(
                  //      crossAxisAlignment: CrossAxisAlignment.stretch,
                  //      children: [
                  //        Text(
                  //          'Adicionar Novo Produto',
                  //          style: TextStyle(
                  //            fontSize: 18,
                  //            fontWeight: FontWeight.bold,
                  //            color: primaryColor, // Roxo como cor de destaque
                  //          ),
                  //        ),
                  //        const SizedBox(height: 20),
                  //
                  //        // Campo de texto estilizado para o tema escuro
                  //        _buildDarkTextFormField(
                  //          labelText: 'Nome do Produto',
                  //          textColor: textColor,
                  //          primaryColor: primaryColor,
                  //        ),
                  //        const SizedBox(height: 16),
                  //        _buildDarkTextFormField(
                  //          labelText: 'Unidade de Medida (Ex: Kg, Unidade, Litro)',
                  //          textColor: textColor,
                  //          primaryColor: primaryColor,
                  //        ),
                  //
                  //        const SizedBox(height: 30),
                  //
                  //        // Botão com fundo roxo
                  //      ],
                  //    ),
                  //  ),
                  //),
                ],
              ),
            ),
          ),
          const Divider(height: 1, thickness: 0.6, color: Colors.white12),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 30,
              left: 40,
              right: 40,
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.save, color: Colors.white),
                label: const Text(
                  'SALVAR PRODUTO',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor, // Fundo roxo
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Produto salvo com sucesso!'),
                      backgroundColor: primaryColor, // SnackBar com cor roxa
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget auxiliar para construir cada item da lista (ListTile)
  Widget _buildProductTile(
    BuildContext context,
    String title,
    String subtitle,
    Color primaryColor,
    Color textColor,
    Color accentColor,
  ) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: textColor.withOpacity(0.7)),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.edit, color: accentColor), // Roxo para Editar
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Ação de Edição para: $title'),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.delete,
              color: Colors.redAccent,
            ), // Vermelho para Excluir
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Ação de Exclusão para: $title'),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // Widget auxiliar para construir o TextFormField com tema escuro
  Widget _buildDarkTextFormField({
    required String labelText,
    required Color textColor,
    required Color primaryColor,
  }) {
    return TextFormField(
      style: TextStyle(color: textColor),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: primaryColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.white30),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.white30),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: primaryColor,
            width: 2,
          ), // Borda focada roxa
        ),
        // Fundo do campo de texto, sutilmente mais claro que o card
        fillColor: const Color.fromARGB(255, 40, 40, 40),
        filled: true,
      ),
    );
  }
}
