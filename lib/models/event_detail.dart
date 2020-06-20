class EventDetail {
  String id;
  String _description;
  String _date;
  String _startTime;
  String _endTime;
  String _speaker;
  String _isFavorite;

  String get description => _description;

  set description(String value) => _description = value;

  String get date => _date;

  set date(String value) => _date = value;

  String get startTime => _startTime;

  set startTime(String value) => _startTime = value;

  String get endTime => _endTime;

  set endTime(String value) => _endTime = value;

  String get speaker => _speaker;

  set speaker(String value) => _speaker = value;

  String get isFavorite => _isFavorite;

  set isFavorite(String value) => _isFavorite = value;

  EventDetail(
    this.id,
    this._description,
    this._date,
    this._startTime,
    this._endTime,
    this._speaker,
    this._isFavorite,
  );

  EventDetail.fromMap(dynamic obj) {
    this.id = obj['id'];
    this._description = obj['description'];
    this._date = obj['date'];
    this._startTime = obj['start_time'];
    this._endTime = obj['end_time'];
    this._speaker = obj['speaker'];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['description'] = _description;
    map['date'] = _date;
    map['start_time'] = _startTime;
    map['end_time'] = _endTime;
    map['speaker'] = _speaker;

    return map;
  }
}
