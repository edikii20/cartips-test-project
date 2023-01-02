import 'dart:convert';

class Qrcode {
  final int id;
  final String title;
  final String color;
  final String code;
  Qrcode({
    required this.id,
    required this.title,
    required this.color,
    required this.code,
  });

  Qrcode copyWith({
    int? id,
    String? title,
    String? color,
    String? code,
  }) {
    return Qrcode(
      id: id ?? this.id,
      title: title ?? this.title,
      color: color ?? this.color,
      code: code ?? this.code,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'color': color,
      'code': code,
    };
  }

  factory Qrcode.fromMap(Map<String, dynamic> map) {
    return Qrcode(
      id: map['id'] as int,
      title: map['title'] as String,
      color: map['color'] as String,
      code: map['code'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Qrcode.fromJson(String source) =>
      Qrcode.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant Qrcode other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.color == color &&
        other.code == code;
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ color.hashCode ^ code.hashCode;
  }
}
