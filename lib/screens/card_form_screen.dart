import 'package:flutter/material.dart';

class CardFormScreen extends StatefulWidget {
  const CardFormScreen({Key? key}) : super(key: key);

  @override
  State<CardFormScreen> createState() => _CardFormScreenState();
}

class _CardFormScreenState extends State<CardFormScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Cartão'),
      ),
      body: SingleChildScrollView(child: Container()),
    );
  }
}
