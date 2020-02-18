import 'package:hive/hive.dart';

part 'note.g.dart';

@HiveType(typeId: 0)
class Note {
  @HiveField(0)
  String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String details;
  @HiveField(3)
  DateTime time;

  Note({this.id, this.title, this.details, this.time});

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json["id"],
      title: json["title"],
      details: json["details"],
      time: DateTime.parse(json["time"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "title": this.title,
      "details": this.details,
      "time": this.time.toIso8601String(),
    };
  }
}
