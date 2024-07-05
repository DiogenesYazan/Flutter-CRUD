import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/ordem_servico.dart';
import '../providers/ordem_servico_provider.dart';

class OrdemServicoScreen extends StatefulWidget {
  @override
  _OrdemServicoScreenState createState() => _OrdemServicoScreenState();
}

class _OrdemServicoScreenState extends State<OrdemServicoScreen> {
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final firestoreService = Provider.of<FirestoreService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Ordem de Serviço'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _tituloController,
              decoration: InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: _descricaoController,
              decoration: InputDecoration(labelText: 'Descrição'),
            ),
            TextField(
              controller: _statusController,
              decoration: InputDecoration(labelText: 'Status'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (_tituloController.text.isNotEmpty &&
                    _descricaoController.text.isNotEmpty &&
                    _statusController.text.isNotEmpty) {
                  final ordemServico = OrdemServico(
                    id: '', // O ID será gerado pelo Firestore
                    titulo: _tituloController.text,
                    descricao: _descricaoController.text,
                    status: _statusController.text,
                    userId: '', // Será adicionado no provider
                  );
                  try {
                    print("Tentando adicionar ordem de serviço...");
                    await firestoreService.adicionarOrdemServico(ordemServico);
                    print("Ordem de serviço adicionada com sucesso!");
                    _tituloController.clear();
                    _descricaoController.clear();
                    _statusController.clear();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Ordem de serviço adicionada com sucesso!')),
                    );
                  } catch (e) {
                    print("Erro ao adicionar ordem de serviço: $e");
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Falha ao adicionar ordem de serviço: $e')),
                    );
                  }
                } else {
                  print("Título, descrição ou status está vazio");
                }
              },
              child: Text('Adicionar Ordem de Serviço'),
            ),
          ],
        ),
      ),
    );
  }
}
