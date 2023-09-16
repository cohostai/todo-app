import 'package:json_annotation/json_annotation.dart';

part 'todo.g.dart';

@JsonSerializable()
class Todo {
  @JsonKey(name: '_id')
  final String? id;
  final String? title;
  bool? isComplete;

  Todo({
    this.id,
    this.title,
    this.isComplete,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
  Map<String, dynamic> toJson() => _$TodoToJson(this);
}
