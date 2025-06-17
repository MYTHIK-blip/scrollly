import 'package:flutter/material.dart';

class WizardScreen extends StatefulWidget {
  @override
  _WizardScreenState createState() => _WizardScreenState();
}

class _WizardScreenState extends State<WizardScreen> {
  int _currentStep = 0;

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
            content: Text('Pick: Template, Planner, or Ebook.'),
            isActive: _currentStep >= 0,
          ),
          Step(
            title: Text('Customize'),
            content: Text('Adjust theme, colors, fonts.'),
            isActive: _currentStep >= 1,
          ),
          Step(
            title: Text('Export'),
            content: Text('Generate and save your scroll.'),
            isActive: _currentStep >= 2,
          ),
        ],
      ),
    );
  }
}
