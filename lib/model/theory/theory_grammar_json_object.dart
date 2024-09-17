
import 'package:json_annotation/json_annotation.dart';

part 'theory_grammar_json_object.g.dart';

@JsonSerializable(explicitToJson: true)
class TheoryGrammarJSONObject {
  @JsonKey(name: "Theorize")
  TheorizeObject? theorize;

  TheoryGrammarJSONObject(this.theorize);

  factory TheoryGrammarJSONObject.fromJson(Map<String, dynamic> json) =>
      _$TheoryGrammarJSONObjectFromJson(json);

  Map<String, dynamic> toJson() => _$TheoryGrammarJSONObjectToJson(this);
}

@JsonSerializable()
class TheorizeObject {
  String? id;
  String? type;

  @JsonKey(name: "lesson_id")
  String? lessonId;

  String? language;
  List<TheoryGrammar>? grammars;

  @JsonKey(name: "_url_")
  String? url;

  TheorizeObject(this.id, this.type, this.lessonId, this.language,
      this.grammars, this.url);

  factory TheorizeObject.fromJson(Map<String, dynamic> json) =>
      _$TheorizeObjectFromJson(json);

  Map<String, dynamic> toJson() => _$TheorizeObjectToJson(this);
}


@JsonSerializable()
class TheoryGrammar {
  @JsonKey(name: "grammar_id")
  String? grammarId;

  String? value;

  @JsonKey(name: "explain_grammar")
  String? explainGrammar;

  String? grammar;

  TheoryGrammar(this.grammarId, this.value, this.explainGrammar, this.grammar);

  factory TheoryGrammar.fromJson(Map<String, dynamic> json) =>
      _$TheoryGrammarFromJson(json);

  Map<String, dynamic> toJson() => _$TheoryGrammarToJson(this);
}