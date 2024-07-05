import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/ordem_servico.dart';

class FirestoreService extends ChangeNotifier {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> adicionarOrdemServico(OrdemServico ordem) async {
    try {
      print("Adicionando ordem de serviço ao Firestore...");
      final User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await _db.collection('ordens_servico').add({
          'titulo': ordem.titulo,
          'descricao': ordem.descricao,
          'status': ordem.status,
          'userId': user.uid,
          'timestamp': FieldValue.serverTimestamp(),
        });
      }
      print("Ordem de serviço adicionada ao Firestore!");
    } catch (e) {
      print("Erro ao adicionar ordem de serviço ao Firestore: $e");
      throw e;
    }
  }

  Future<void> atualizarOrdemServico(OrdemServico ordem) async {
    try {
      await _db.collection('ordens_servico').doc(ordem.id).update(ordem.toJsonUpdate());
      print("Ordem de serviço atualizada com sucesso!");
    } catch (e) {
      print("Erro ao atualizar ordem de serviço: $e");
      throw e;
    }
  }

  Future<void> deletarOrdemServico(String id) async {
    try {
      await _db.collection('ordens_servico').doc(id).delete();
      print("Ordem de serviço deletada com sucesso!");
    } catch (e) {
      print("Erro ao deletar ordem de serviço: $e");
      throw e;
    }
  }
}
