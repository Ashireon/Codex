import 'package:flutter/material.dart';

class RouillonPage extends StatefulWidget {
  const RouillonPage({Key? key}) : super(key: key);

  @override
  State<RouillonPage> createState() => _RouillonPageState();
}

class _RouillonPageState extends State<RouillonPage> {
  final _formKey = GlobalKey<FormState>();
  final _lengthController = TextEditingController();
  final _departmentController = TextEditingController();

  String? _result;

  @override
  void dispose() {
    _lengthController.dispose();
    _departmentController.dispose();
    super.dispose();
  }

  void _calculate() {
    if (_formKey.currentState!.validate()) {
      final length = double.parse(_lengthController.text);
      final department = int.parse(_departmentController.text);
      // TODO: Replace with lookup using Excel or your data source
      setState(() {
        _result = 'Frais Rouillon: €${(length * 0.5 + department).toStringAsFixed(2)}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rouillon')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _lengthController,
                decoration: const InputDecoration(labelText: 'Longueur plancher (m)'),
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
