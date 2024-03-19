import 'dart:convert';

class JokeModelResponse {
  final int id;
  final String joke;
  final int status;

  JokeModelResponse({
    required this.id,
    required this.joke,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'joke': joke,
      'status': status,
    };
  }

  factory JokeModelResponse.fromMap(Map<String, dynamic> map) {
    return JokeModelResponse(
      id: map['id']?.toInt() ?? 0,
      joke: map['joke'] ?? '',
      status: map['status']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory JokeModelResponse.fromJson(String source) =>
      JokeModelResponse.fromMap(json.decode(source));
}
