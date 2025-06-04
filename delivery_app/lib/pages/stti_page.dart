import 'package:flutter/material.dart';

class SttiPage extends StatefulWidget {
  const SttiPage({Key? key}) : super(key: key);

  @override
  State<SttiPage> createState() => _SttiPageState();
}

class _SttiPageState extends State<SttiPage> {
  final _formKey = GlobalKey<FormState>();
  final _lengthController = TextEditingController();
  final _departmentController = TextEditingController();
  bool _unloading = false;

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
      setState(() {
        double base = length * 0.6 + department;
        if (_unloading) base += 10.0;
        _result = 'Frais STTI: €${base.toStringAsFixed(2)}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('STTI')),
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
              CheckboxListTile(
                title: const Text('Option déchargement'),
                value: _unloading,
                onChanged: (val) => setState(() => _unloading = val ?? false),
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
