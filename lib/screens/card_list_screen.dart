import 'package:flutter/material.dart';

class CardListScreen extends StatefulWidget {
  const CardListScreen({Key? key}) : super(key: key);

  @override
  State<CardListScreen> createState() => _CardListScreenState();
}

class _CardListScreenState extends State<CardListScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _businessController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Business Card'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Apertou');
          _showPopupForm(context);
          //_turnOnModalVisible(context);
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => CardFormScreen(),
          //   ),
          // );
        },
        child: const Icon(Icons.add),
      ),
      body: Container(),
    );
  }

  void submitForm() {
    print(_nameController.text);
    print(_phoneController.text);
    _nameController.text = '';
  }

  Future<void> _showPopupForm(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Cadastrar Cartão',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  icon: Icon(Icons.person_outline),
                ),
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Preencha o campo nome';
                  }

                  if (value.length < 3) {
                    return 'Preencha com um nome válido';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Telefone',
                  icon: Icon(Icons.phone_android),
                ),
                controller: _phoneController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Preencha o campo telefone';
                  }

                  if (value.length < 8) {
                    return 'Telefone inválido';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                  icon: Icon(Icons.email),
                ),
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Preencha o campo e-mail';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Empresa',
                  icon: Icon(Icons.apartment),
                ),
                controller: _businessController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Preencha o nome da empresa';
                  }

                  if (value.length < 5) {
                    return 'Nome de empresa muito curto';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Formulário válido.'),
                        ),
                      );
                      submitForm();
                      Navigator.of(context).pop();
                    }
                    //Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.save_outlined),
                  label: const Text('Cadastrar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//   void _turnOnModalVisible(context) {
//     showModalBottomSheet(
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(
//           top: Radius.circular(20),
//         ),
//       ),
//       context: context,
//       builder: (BuildContext bc) {
//         return Container(
//           decoration: BoxDecoration(
//             //border: Border.all(color: Colors.purple),
//             borderRadius: BorderRadius.circular(20),
//             // gradient: const LinearGradient(
//             //   colors: [
//             //     Colors.black45,
//             //     Colors.black38,
//             //   ],
//             // ),
//           ),
//           padding: const EdgeInsets.all(30.0),
//           child: ListView(
//             children: [
//               Form(
//                 child: Column(
//                   children: [
//
//
//
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
