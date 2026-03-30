import "dart:convert";
import 'package:countdown/models/countdown_event.model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventStore {
  static const String _eventsKey = "countdown_events";

  Future<List<CountdownEvent>> loadEvents() async {
    final prefs = await SharedPreferences.getInstance();
    final eventsJson = prefs.getString(_eventsKey);
    if (eventsJson != null) {
      final List<dynamic> decodedList = jsonDecode(eventsJson);
      return decodedList.map((e) => CountdownEvent.fromMap(e as Map<String, dynamic>)).toList();
    }
    return [];
  }

  Future<void> saveEvents(List<CountdownEvent> events) async {
    final prefs = await SharedPreferences.getInstance();
    final eventsJson = jsonEncode(events.map((e) => e.toJson()).toList());
    await prefs.setString(_eventsKey, eventsJson);
  }
}