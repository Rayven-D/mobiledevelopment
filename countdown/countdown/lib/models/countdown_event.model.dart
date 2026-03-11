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

}