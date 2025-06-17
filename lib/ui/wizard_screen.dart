import 'package:flutter/material.dart';
import '../forge/scroll_forge.dart'; // add this at the top

class WizardScreen extends StatefulWidget {
  @override
  _WizardScreenState createState() => _WizardScreenState();
}

class _WizardScreenState extends State<WizardScreen> {
  int _currentStep = 0;

  String _selectedProductType = 'Template';
  Color _selectedColor = Colors.indigo;

  final List<String> _productTypes = ['Template', 'Planner', 'Ebook'];
  final List<Color> _colors = [
    Colors.indigo,
    Colors.teal,
    Colors.pink,
    Colors.red,
    Colors.green,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scrollly Wizard'),
      ),
      body: Stepper(
        currentStep: _currentStep,
        onStepContinue: () {
          if (_currentStep < 2) {
            setState(() {
              _currentStep += 1;
            });
          } else {
            _generateScroll();
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() {
              _currentStep -= 1;
            });
          }
        },
        steps: [
          Step(
            title: Text('Choose Product Type'),
            content: DropdownButton<String>(
              value: _selectedProductType,
              items: _productTypes.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedProductType = newValue!;
                });
              },
            ),
            isActive: _currentStep >= 0,
          ),
          Step(
            title: Text('Customize'),
            content: Row(
              children: _colors.map((color) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedColor = color;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    child: CircleAvatar(
                      backgroundColor: color,
                      radius: 20,
                      child: _selectedColor == color
                          ? Icon(Icons.check, color: Colors.white)
                          : null,
                    ),
                  ),
                );
              }).toList(),
            ),
            isActive: _currentStep >= 1,
          ),
          Step(
            title: Text('Export'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Product: $_selectedProductType'),
                Text('Theme Color: $_selectedColor'),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _generateScroll,
                  child: Text('Generate Scroll (Mock)'),
                ),
              ],
            ),
            isActive: _currentStep >= 2,
          ),
        ],
      ),
    );
  }

void _generateScroll() async {
  final forge = ScrollForge();
  final path = await forge.forgeScroll(
    productType: _selectedProductType,
    themeColor: _selectedColor.toString(),
  );

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Scroll Generated!'),
      content: Text('Saved at:\n$path'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('OK'),
        ),
      ],
    ),
  );
}
