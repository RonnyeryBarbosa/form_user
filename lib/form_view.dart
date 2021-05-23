import 'package:flutter/material.dart';

class FormView extends StatefulWidget {
  @override
  _FormViewState createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final sobrenomeController = TextEditingController();

    return Scaffold(
        body: SafeArea(
      child: Form(
          key: _formKey,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.blue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  constraints: BoxConstraints(
                    maxHeight: 230,
                    maxWidth: 500,
                    minWidth: 250,
                    minHeight: 230,
                  ),
                  padding: EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Flexible(
                        child: Text(
                          "Validar Usuário",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Flexible(
                        flex: 1,
                        child: TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(hintText: "Nome"),
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Nome é obrigatorio';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Flexible(
                        child: TextFormField(
                          controller: sobrenomeController,
                          decoration: InputDecoration(hintText: "Sobrenome"),
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Sobrenome é obrigatorio';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Flexible(
                          child: ElevatedButton(
                        onPressed: () {
                          final isValid = _formKey.currentState.validate();
                          if (isValid) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text(
                                        '${nameController.text} ${sobrenomeController.text}'),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Ok'))
                                    ],
                                  );
                                });
                          }
                          print(isValid);
                        },
                        child: Text('Validar'),
                      )),
                    ],
                  ),
                ),
              ],
            ),
          )),
    ));
  }
}
