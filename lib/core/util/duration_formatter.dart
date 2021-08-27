class DurationFormatter {

  final Duration _duration;
  DurationFormatter(this._duration) : assert(_duration != null);

  String get fullHHmmss {
    String result = this._duration.toString().split('.').first;
    List<String> times = result.split(':');
    int hour = int.parse(times[0]);
    int minute = int.parse(times[1]);
    int second = int.parse(times[2]);
    result = '';
    if (hour > 0) result += '$hour giờ $minute phút ';
    else if (minute > 0) result += '$minute phút ';
    result += '$second giây';
    return result;
  }
}