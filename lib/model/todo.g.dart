// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Todo _$TodoFromJson(Map<String, dynamic> json) => Todo(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      isComplete: json['isComplete'] as bool?,
    );

Map<String, dynamic> _$TodoToJson(Todo instance) => <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'isComplete': instance.isComplete,
    };
