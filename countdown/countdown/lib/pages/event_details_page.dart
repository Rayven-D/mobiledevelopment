import 'package:countdown/models/countdown_event.model.dart';
import 'package:flutter/material.dart';

class EventDetailsPage extends StatelessWidget {
  final CountdownEvent event;

  const EventDetailsPage({
    required this.event,
    super.key
  });

  String _formatDate(DateTime dt) {
    return '${dt.year.toString().padLeft(4, '0')}-'
        '${dt.month.toString().padLeft(2, '0')}-'
        '${dt.day.toString().padLeft(2, '0')} '
        '${dt.hour.toString().padLeft(2, '0')}:'
        '${dt.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(event.eventName,
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 8),
            const SizedBox(height: 16),
            if (event.eventTime != null) ...[
              Row(
                children: [
                  const Icon(Icons.calendar_today, size: 20),
                  const SizedBox(width: 8),
                  Text(_formatDate(event.eventTime!)),
                ],
              ),
            ],
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Back'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}