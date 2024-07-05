import 'package:flutter/material.dart';
import '../models/ordem_servico.dart';

class OrdemServicoList extends StatelessWidget {
  final List<OrdemServico> ordens;

  OrdemServicoList({required this.ordens});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ordens.length,
      itemBuilder: (context, index) {
        final ordem = ordens[index];
        return ListTile(
          title: Text(ordem.descricao),
        );
      },
    );
  }
}
