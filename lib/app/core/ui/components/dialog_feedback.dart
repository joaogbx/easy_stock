import 'package:flutter/material.dart';

class DialogFeedback extends StatefulWidget {
  final String message;
  final String title;
  final bool success;

  const DialogFeedback({
    required this.message,
    required this.title,
    required this.success,
  });

  @override
  State<DialogFeedback> createState() => _DialogFeedbackState();
}

class _DialogFeedbackState extends State<DialogFeedback> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(70),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: width * 0.57,
                  height: 160,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 3, 255, 137),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: width,
                  height: 150,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(71, 26, 25, 25),
                        offset: Offset(0, 10),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [Text(widget.title), Text(widget.message)],
                  ),
                ),
              ),
              Positioned(
                left: 20,
                right: 20,
                top: 0, // Posicionado no topo da Stack
                child: CircleAvatar(
                  // 1. Este é o seu círculo verde principal.
                  // Ele também servirá de fundo para o "espaço".
                  backgroundColor: const Color.fromARGB(255, 35, 212, 103),
                  radius: 30,

                  // O 'child' do CircleAvatar definirá o conteúdo interno
                  child: Padding(
                    // 2. Este Padding cria o "espaço" que você pediu.
                    // O fundo verde do CircleAvatar aparecerá através dele.
                    padding: const EdgeInsets.all(
                      3.0,
                    ), // Ajuste o valor para mais ou menos espaço

                    child: Container(
                      // 3. Este Container será a "linha branca"
                      decoration: BoxDecoration(
                        shape: BoxShape
                            .circle, // Garante que a linha seja um círculo
                        border: Border.all(
                          color: Colors.white,
                          width: 2.0, // A espessura da linha branca
                        ),
                      ),
                      child: const Center(
                        // 4. O Ícone agora fica dentro da linha branca
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          // Ajustei o tamanho, pois o 'size: 30' original
                          // ficaria muito grande para caber dentro da nova borda.
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
