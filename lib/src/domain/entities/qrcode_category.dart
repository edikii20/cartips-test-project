import 'dart:convert';

class QrcodeCategory {
  final int id;
  final String title;
  QrcodeCategory({
    required this.id,
    required this.title,
  });

  QrcodeCategory copyWith({
    int? id,
    String? title,
  }) {
    return QrcodeCategory(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
    };
  }

  factory QrcodeCategory.fromMap(Map<String, dynamic> map) {
    return QrcodeCategory(
      id: map['id'] as int,
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory QrcodeCategory.fromJson(String source) =>
      QrcodeCategory.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant QrcodeCategory other) {
    if (identical(this, other)) return true;

    return other.id == id && other.title == title;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode;
}
