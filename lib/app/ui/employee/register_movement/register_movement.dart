import 'package:easy_stock/app/core/enums/register_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterMovement extends StatelessWidget {
  final RegisterMode registerMode;
  const RegisterMovement({super.key, required this.registerMode});

  String get type => registerMode == RegisterMode.stockIn ? 'Entrada' : 'Saída';

  Color get _buttonColor => type == 'Entrada' ? Colors.green : Colors.redAccent;

  @override
  Widget build(BuildContext context) {
    // ... CÓDIGO MovimentacaoScreen original ...
    return Scaffold(
      appBar: AppBar(title: Text('Registrar $type')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Detalhes da $type',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nome do Produto',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.category),
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Quantidade',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.numbers),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16),
                TextFormField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: 'Observação (opcional)',
                    border: OutlineInputBorder(),
                    alignLabelWithHint: true,
                    prefixIcon: Icon(Icons.edit_note),
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton.icon(
                  icon: Icon(Icons.check_circle_outline),
                  label: Text('CONFIRMAR ${type.toUpperCase()}'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _buttonColor,
                    minimumSize: Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('$type registrada com sucesso!'),
                        backgroundColor: _buttonColor,
                      ),
                    );
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
