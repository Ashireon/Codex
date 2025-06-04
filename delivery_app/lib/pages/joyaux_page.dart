import 'package:flutter/material.dart';

class JoyauxPage extends StatefulWidget {
  const JoyauxPage({Key? key}) : super(key: key);

  @override
  State<JoyauxPage> createState() => _JoyauxPageState();
}

class _JoyauxPageState extends State<JoyauxPage> {
  final _formKey = GlobalKey<FormState>();
  final _weightController = TextEditingController();
  final _departmentController = TextEditingController();

  String? _result;

  @override
  void dispose() {
    _weightController.dispose();
    _departmentController.dispose();
    super.dispose();
  }

  void _calculate() {
    if (_formKey.currentState!.validate()) {
      final weight = double.parse(_weightController.text);
      final department = int.parse(_departmentController.text);
      setState(() {
        _result = 'Frais Joyaux: €${(weight * 1.2 + department).toStringAsFixed(2)}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Joyaux')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _weightController,
                decoration: const InputDecoration(labelText: 'Poids (kg)'),
                keyboardType: TextInputType.number,
                validator: (value) => value == null || value.isEmpty ? 'Requis' : null,
              ),
              TextFormField(
                controller: _departmentController,
                decoration: const InputDecoration(labelText: 'Département'),
                keyboardType: TextInputType.number,
                validator: (value) => value == null || value.isEmpty ? 'Requis' : null,
              ),
              const SizedBox(height: 16),
              ElevatedButton(onPressed: _calculate, child: const Text('Calculer')),
              if (_result != null) ...[
                const SizedBox(height: 16),
                Text(_result!, style: const TextStyle(fontSize: 18)),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
