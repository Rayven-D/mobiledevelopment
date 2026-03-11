
import 'package:countdown/models/countdown_event.model.dart';
import 'package:flutter/material.dart';

class AddEventSheet extends StatefulWidget{
  const AddEventSheet({super.key});

  @override
  State<AddEventSheet> createState() => _AddEventSteetState();
}

class _AddEventSteetState extends State<AddEventSheet> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  DateTime _selectedDateTime = DateTime.now().add(Duration(days: 1));
  TimeOfDay _selectedTime = TimeOfDay.now();


  @override
  void dispose(){
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24, //lifts above keyboard
        left: 24,
        right: 24
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("New Event", style: Theme.of(context).textTheme.headlineSmall),
            SizedBox(height: 16),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                label: Text("Event Name", style: Theme.of(context).textTheme.labelLarge),
                border: UnderlineInputBorder(),
              ),
              validator: (value){
                if(value == null || value.isEmpty){
                  return "Please enter a name for the event";
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Text("Time", style: Theme.of(context).textTheme.labelMedium)
                ),
                SizedBox(width: 8,),
                Expanded(
                  child: Text("Date", style: Theme.of(context).textTheme.labelMedium)
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    icon: Icon(Icons.access_time),
                    label: Text("${_selectedTime.format(context)}"),
                    onPressed: () async {
                      final picked = await showTimePicker(
                        context: context,
                        initialTime: _selectedTime,
                        initialEntryMode: TimePickerEntryMode.dial,
                        
                      );
                      if(picked != null){
                        setState(() {
                          _selectedTime = picked;
                        });
                      }
                    },
                  ),
                ),
                SizedBox(width: 8,),
                Expanded(
                  child:  OutlinedButton.icon(
                    icon: Icon(Icons.calendar_today),
                    label: Text("${_selectedDateTime.month}/${_selectedDateTime.day}/${_selectedDateTime.year}"),
                    onPressed: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: _selectedDateTime,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(Duration(days: 365 * 10))
                      );
                      if(picked != null){
                        setState(() {
                          _selectedDateTime = picked;
                        });
                      }
                    },
                  ),
                )
              ],
            ),
            SizedBox(height: 16,),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final newEvent = CountdownEvent(
                    eventName: _nameController.text,
                    eventTime: DateTime(_selectedDateTime.year, _selectedDateTime.month, _selectedDateTime.day, _selectedTime.hour, _selectedTime.minute)
                  );
                  
                  Navigator.pop(context, newEvent);
                  }
              },
              child: Text("Create Countdown")
            )
          ],
        ),
      )
    );
  }
}