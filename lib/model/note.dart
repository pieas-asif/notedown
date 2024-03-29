import 'package:hive/hive.dart';

part 'note.g.dart';

@HiveType(typeId: 0)
class Note extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String? content;
  @HiveField(2)
  DateTime createdOn;
  @HiveField(3)
  DateTime updatedOn;
  @HiveField(4)
  int colorIndex;
  @HiveField(5)
  bool isMarkDown;
  @HiveField(6)
  bool? archived;

  Note({
    required this.name,
    this.content,
    required this.createdOn,
    required this.updatedOn,
    this.colorIndex = 0,
    this.isMarkDown = false,
    this.archived = false,
  });

  @override
  String toString() {
    return name;
  }

  void archive() {
    archived = true;
    save();
  }

  void restore() {
    archived = false;
    save();
  }

  void update(
    String name,
    String? content,
    DateTime updatedOn,
  ) {
    this.name = name;
    this.content = content;
    this.updatedOn = updatedOn;
    save();
  }
}
