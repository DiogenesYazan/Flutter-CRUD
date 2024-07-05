import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/ordem_servico.dart';
import '../providers/ordem_servico_provider.dart';

class EditOrdemServicoScreen extends StatefulWidget {
  final OrdemServico ordemServico;

  EditOrdemServicoScreen({required this.ordemServico});

  @override
  _EditOrdemServicoScreenState createState() => _EditOrdemServicoScreenState();
}

class _EditOrdemServicoScreenState extends State<EditOrdemServicoScreen> {
  late TextEditingController _tituloController;
  late TextEditingController _descricaoController;
  late TextEditingController _statusController;

  @override
  void initState() {
    super.initState();
    _tituloController = TextEditingController(text: widget.ordemServico.titulo);
    _descricaoController = TextEditingController(text: widget.ordemServico.descricao);
    _statusController = TextEditingController(text: widget.ordemServico.status);
  }

  @override
  Widget build(BuildContext context) {
    final firestoreService = Provider.of<FirestoreService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Ordem de Serviço'),
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
                  final updatedOrdemServico = OrdemServico(
                    id: widget.ordemServico.id,
                    titulo: _tituloController.text,
                    descricao: _descricaoController.text,
                    status: _statusController.text,
                    userId: widget.ordemServico.userId,
                  );
                  try {
                    await firestoreService.atualizarOrdemServico(updatedOrdemServico);
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Ordem de serviço atualizada com sucesso!')),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Falha ao atualizar ordem de serviço: $e')),
                    );
                  }
                } else {
                  print("Título, descrição ou status está vazio");
                }
              },
              child: Text('Atualizar Ordem de Serviço'),
            ),
          ],
        ),
      ),
    );
  }
}
