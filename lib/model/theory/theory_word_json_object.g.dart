// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theory_word_json_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TheoryWordJSONObject _$TheoryWordJSONObjectFromJson(
        Map<String, dynamic> json) =>
    TheoryWordJSONObject(
      json['Theorize'] == null
          ? null
          : TheorizeObject.fromJson(json['Theorize'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TheoryWordJSONObjectToJson(
        TheoryWordJSONObject instance) =>
    <String, dynamic>{
      'Theorize': instance.theorize?.toJson(),
    };

TheorizeObject _$TheorizeObjectFromJson(Map<String, dynamic> json) =>
    TheorizeObject(
      json['id'] as String?,
      json['type'] as String?,
      json['lesson_id'] as String?,
      json['language'] as String?,
      (json['words'] as List<dynamic>?)
          ?.map((e) => TheoryWord.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['_url_'] as String?,
    );

Map<String, dynamic> _$TheorizeObjectToJson(TheorizeObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'lesson_id': instance.lessonId,
      'language': instance.language,
      'words': instance.words,
      '_url_': instance.url,
    };

TheoryWord _$TheoryWordFromJson(Map<String, dynamic> json) => TheoryWord(
      json['word_id'] as String?,
      json['word'] as String?,
      json['mean'] as String?,
      json['audio'] as String?,
      (json['results'] as List<dynamic>?)
          ?.map((e) => TheoryWordResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TheoryWordToJson(TheoryWord instance) =>
    <String, dynamic>{
      'word_id': instance.wordId,
      'word': instance.word,
      'mean': instance.mean,
      'audio': instance.audio,
      'results': instance.results,
    };

TheoryWordResult _$TheoryWordResultFromJson(Map<String, dynamic> json) =>
    TheoryWordResult(
      json['mean'] as String?,
      json['content'] as String?,
    );

Map<String, dynamic> _$TheoryWordResultToJson(TheoryWordResult instance) =>
    <String, dynamic>{
      'mean': instance.mean,
      'content': instance.content,
    };
