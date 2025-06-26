/*
 * SEMANTIC WIDGETS IN FLUTTER - PRESENTATION DEMO
 * 
 * WHAT ARE SEMANTIC WIDGETS?
 * - Widgets that provide meaning and context to screen readers
 * - Help blind and visually impaired users understand your app
 * - Make your app accessible to everyone
 * 
 * WHY USE THEM?
 * - Legal requirement in many countries
 * - Better user experience for disabled users
 * - Good practice for inclusive design
 * 
 * HOW TO USE:
 * 1. Wrap any widget with Semantics()
 * 2. Add properties like: label, hint, value, button
 * 3. Test with screen reader (TalkBack/VoiceOver)
 * 
 * KEY PROPERTIES:
 * - label: What is this element? (e.g., "Warning button")
 * - hint: What does it do? (e.g., "Tap to show warning")
 * - value: Current state (e.g., "Counter is 5")
 * - button: true/false - Is this clickable?
 * 
 * EXAMPLES BELOW:
 * ❌ Bad: Container without semantics
 * ✅ Good: Same container WITH semantics
 * 🎯 Interactive: Button that announces its action
 */

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Semantic Widgets Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Semantic Widgets Demo'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // EXAMPLE 1: BAD - No semantics (Screen reader doesn't understand)
            Text(
              '❌ BAD: Without Semantics',
              style: TextStyle(
                  fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              width: 100,
              height: 50,
              color: Colors.red,
              child: Icon(Icons.warning, color: Colors.white, size: 30),
            ),
            Text('Screen reader says: "Container, Button" - Not helpful!'),

            SizedBox(height: 40),

            // EXAMPLE 2: GOOD - With semantics (Screen reader understands!)
            Text(
              '✅ GOOD: With Semantics',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Semantics(
              label: 'Warning alert', // WHAT is this?
              hint: 'This is an important warning message', // WHAT does it do?
              child: Container(
                width: 100,
                height: 50,
                color: Colors.green,
                child: Icon(Icons.check, color: Colors.white, size: 30),
              ),
            ),
            Text(
                'Screen reader says: "Warning alert, This is an important warning message"'),

            SizedBox(height: 40),

            // EXAMPLE 3: Interactive button with live updates
            Text(
              '🎯 Interactive Example',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            // Counter display with dynamic value
            Semantics(
              label: 'Counter', // WHAT is this?
              value: 'Current number is $counter', // CURRENT STATE
              child: Text(
                'Count: $counter',
                style: TextStyle(fontSize: 30),
              ),
            ),

            SizedBox(height: 20),

            // Button with complete semantic information
            Semantics(
              button: true, // This IS a button
              label: 'Add button', // WHAT is this?
              hint: 'Tap to increase the number', // WHAT happens when pressed?
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    counter++; // Updates the counter
                  });
                },
                child: Text('Tap Me!'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
