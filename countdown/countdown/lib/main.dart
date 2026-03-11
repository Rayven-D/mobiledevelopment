import 'package:countdown/models/countdown_event.model.dart';
import 'package:countdown/widgets/add_event_sheet.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.greenAccent,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      themeMode: ThemeMode.system
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<CountdownEvent> events = [];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Countdown"), backgroundColor: Theme.of(context).colorScheme.inversePrimary,),

      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          return Dismissible(
            key: Key(event.eventName),
            confirmDismiss: (direction) => showDialog<bool>(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Delete Event?"),
                content: Text("Are you sure you want to delete event \"${event.eventName}\""),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: Text("Cancel")
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: Text("Delete")
                  )
                ]
              )
            ),
            onDismissed: (direction) {
              setState(() {
                events.remove(event);
              });
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 16),
              child: Icon(Icons.delete, color: Colors.white),
            ),
            secondaryBackground: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 16),
              child: Icon(Icons.delete, color: Colors.white),
            ),
            child:  Card(
              margin: EdgeInsets.all(8),
              color: Theme.of(context).colorScheme.onPrimary,
              child: ListTile(
                
                title: Text(event.eventName),
                subtitle: Text(DateFormat('MMM dd, yyyy | h:mm a').format(event.eventTime))
              ),
            )
          );
        }
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newEvent = await showModalBottomSheet(context: context, builder: (context) => AddEventSheet(), isDismissible: true,);

          if(newEvent != null){
            setState(() {
              events.add(newEvent);
            });
          }
        },
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Colors.white,
      )
    );
  }
}