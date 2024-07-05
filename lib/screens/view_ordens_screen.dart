import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ordem_servico/screens/edit_ordem_servico_screen.dart';
import 'package:provider/provider.dart';
import '../models/ordem_servico.dart';
import '../providers/ordem_servico_provider.dart';

class ViewOrdensScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Ordens de Serviço'),
        ),
        body: Center(
          child: Text('Você precisa estar logado para ver as ordens de serviço.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Ordens de Serviço'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('ordens_servico')
            .where('userId', isEqualTo: user.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar ordens de serviço'));
          }

          final ordens = snapshot.data!.docs;

          if (ordens.isEmpty) {
            return Center(child: Text('Nenhuma ordem de serviço encontrada.'));
          }

          return ListView.builder(
            itemCount: ordens.length,
            itemBuilder: (context, index) {
              final ordem = ordens[index];
              final ordemServico = OrdemServico.fromDocument(ordem);

              return Card(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  title: Text(ordem['titulo']),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(ordem['descricao']),
                      Text('Status: ${ordem['status']}'),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  EditOrdemServicoScreen(ordemServico: ordemServico)));
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          Provider.of<FirestoreService>(context, listen: false)
                              .deletarOrdemServico(ordem.id);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
