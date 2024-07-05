import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addOrdemServico(String titulo, String descricao, String status) async {
    final User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      await _db.collection('ordens_servico').add({
        'titulo': titulo,
        'descricao': descricao,
        'status': status,
        'userId': user.uid,
        'timestamp': FieldValue.serverTimestamp(),
      });
    }
  }
}
