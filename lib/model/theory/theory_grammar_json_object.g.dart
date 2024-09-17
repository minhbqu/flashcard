// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theory_grammar_json_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TheoryGrammarJSONObject _$TheoryGrammarJSONObjectFromJson(
        Map<String, dynamic> json) =>
    TheoryGrammarJSONObject(
      json['Theorize'] == null
          ? null
          : TheorizeObject.fromJson(json['Theorize'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TheoryGrammarJSONObjectToJson(
        TheoryGrammarJSONObject instance) =>
    <String, dynamic>{
      'Theorize': instance.theorize?.toJson(),
    };

TheorizeObject _$TheorizeObjectFromJson(Map<String, dynamic> json) =>
    TheorizeObject(
      json['id'] as String?,
      json['type'] as String?,
      json['lesson_id'] as String?,
      json['language'] as String?,
      (json['grammars'] as List<dynamic>?)
          ?.map((e) => TheoryGrammar.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['_url_'] as String?,
    );

Map<String, dynamic> _$TheorizeObjectToJson(TheorizeObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'lesson_id': instance.lessonId,
      'language': instance.language,
      'grammars': instance.grammars,
      '_url_': instance.url,
    };

TheoryGrammar _$TheoryGrammarFromJson(Map<String, dynamic> json) =>
    TheoryGrammar(
      json['grammar_id'] as String?,
      json['value'] as String?,
      json['explain_grammar'] as String?,
      json['grammar'] as String?,
    );

Map<String, dynamic> _$TheoryGrammarToJson(TheoryGrammar instance) =>
    <String, dynamic>{
      'grammar_id': instance.grammarId,
      'value': instance.value,
      'explain_grammar': instance.explainGrammar,
      'grammar': instance.grammar,
    };
