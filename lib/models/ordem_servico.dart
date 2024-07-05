import 'package:cloud_firestore/cloud_firestore.dart';

class OrdemServico {
  String id;
  String titulo;
  String descricao;
  String status;
  String userId;

  OrdemServico({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.status,
    required this.userId,
  });

  Map<String, dynamic> toJson() {
    return {
      'titulo': titulo,
      'descricao': descricao,
      'status': status,
      'userId': userId,
    };
  }

  Map<String, dynamic> toJsonUpdate() {
    return {
      'titulo': titulo,
      'descricao': descricao,
      'status': status,
    };
  }

  static OrdemServico fromDocument(DocumentSnapshot doc) {
    return OrdemServico(
      id: doc.id,
      titulo: doc['titulo'],
      descricao: doc['descricao'],
      status: doc['status'],
      userId: doc['userId'],
    );
  }
}
