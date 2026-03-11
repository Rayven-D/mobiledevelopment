import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Crash Course',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crash Course'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // 1. TEXT STYLES
            Text(
              'Counter: $_counter',
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),

            const SizedBox(height: 32),  // spacer — like margin in CSS

            // 2. DIFFERENT BUTTON TYPES
            ElevatedButton(
              onPressed: () => setState(() => _counter++),  // inline lambda
              child: const Text('Increment'),
            ),

            const SizedBox(height: 8),

            OutlinedButton(
              onPressed: () => setState(() => _counter--),
              child: const Text('Decrement'),
            ),

            const SizedBox(height: 8),

            TextButton(
              onPressed: () => setState(() => _counter = 0),
              child: const Text('Reset'),
            ),

            const SizedBox(height: 32),

            // 3. CONDITIONAL RENDERING — like *ngIf in Angular
            if (_counter > 10)
              const Text(
                '🔥 Over 10!',
                style: TextStyle(fontSize: 20, color: Colors.orange),
              ),

            if (_counter < 0)
              const Text(
                '❄️ Gone negative!',
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),

            const SizedBox(height: 32),

            // 4. ROW — horizontal layout
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // 5. CONTAINER — like a styled div
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(child: Text('$_counter', style: const TextStyle(fontSize: 24))),
                ),

                // 6. ICON BUTTON
                IconButton(
                  icon: const Icon(Icons.add_circle, size: 48, color: Colors.deepPurple),
                  onPressed: () => setState(() => _counter++),
                ),

                IconButton(
                  icon: const Icon(Icons.remove_circle, size: 48, color: Colors.red),
                  onPressed: () => setState(() => _counter--),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}