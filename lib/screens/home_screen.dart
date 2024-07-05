import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ordem_servico/services/auth_service.dart';
import 'view_ordens_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final user = authService.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Bem vindo,'),
              accountEmail: Text(user?.email ?? 'Usuário'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  user?.email?.substring(0, 1).toUpperCase() ?? '',
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
            ),
            ListTile(
              leading: Icon(Icons.assignment),
              title: Text('Ordem de Serviço'),
              onTap: () {
                Navigator.pushNamed(context, '/ordem_servico');
              },
            ),
            ListTile(
              leading: Icon(Icons.view_list),
              title: Text('Visualisa Ordem de Serviço'),
              onTap: () {
                Navigator.pushNamed(context, '/view_ordens');
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                authService.signOut();
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Bem-vindo, ${user?.email ?? 'Usuário'}!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
