import 'package:flutter/material.dart';
import 'package:ordem_servico/services/firestore_service.dart';

class OrdemServicoForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final String titulo;
  final String descricao;
  final String status;
  final Function(String) onTituloChanged;
  final Function(String) onDescricaoChanged;
  final Function(String) onStatusChanged;
  final FirestoreService _firestoreService = FirestoreService();

  OrdemServicoForm({
    required this.formKey,
    required this.titulo,
    required this.descricao,
    required this.status,
    required this.onTituloChanged,
    required this.onDescricaoChanged,
    required this.onStatusChanged,
  });

  void enviarParaFirebase() {
    if (formKey.currentState!.validate()) {
      // Usar FirestoreService para salvar os dados
      _firestoreService.addOrdemServico(titulo, descricao, status);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Título'),
            initialValue: titulo,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, insira o título';
              }
              return null;
            },
            onChanged: onTituloChanged,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Descrição'),
            initialValue: descricao,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, insira a descrição';
              }
              return null;
            },
            onChanged: onDescricaoChanged,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Status'),
            initialValue: status,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, insira o status';
              }
              return null;
            },
            onChanged: onStatusChanged,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: enviarParaFirebase,
            child: Text('Adicionar Ordem de Serviço'),
          ),
        ],
      ),
    );
  }
}
