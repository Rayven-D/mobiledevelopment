class CountdownEvent {
  String eventName;
  DateTime eventTime;

  CountdownEvent({
    required this.eventName,
    required this.eventTime
  });

  bool setEventName(String newName) {
    eventName = newName;
    return true;
  }

  bool setEventTime(DateTime eventTime) {
    this.eventTime = eventTime;
    return true;
  }

  Map<String, dynamic> toJson() {
    return {
      'eventName': eventName,
      'eventTime': eventTime.toIso8601String(),
    };
  }

  factory CountdownEvent.fromMap(Map<String, dynamic> map) {
    return CountdownEvent(
      eventName: map['eventName'],
      eventTime: DateTime.parse(map['eventTime']),
    );
  }

}