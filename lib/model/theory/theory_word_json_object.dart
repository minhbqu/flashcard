import 'package:json_annotation/json_annotation.dart';

part 'theory_word_json_object.g.dart';

@JsonSerializable(explicitToJson: true)
class TheoryWordJSONObject {
  @JsonKey(name: "Theorize")
  TheorizeObject? theorize;

  TheoryWordJSONObject(this.theorize);

  factory TheoryWordJSONObject.fromJson(Map<String, dynamic> json) =>
      _$TheoryWordJSONObjectFromJson(json);

  Map<String, dynamic> toJson() => _$TheoryWordJSONObjectToJson(this);
}

@JsonSerializable()
class TheorizeObject {
  String? id;
  String? type;

  @JsonKey(name: "lesson_id")
  String? lessonId;

  String? language;

  List<TheoryWord>? words;

  @JsonKey(name: "_url_")
  String? url;

  TheorizeObject(
      this.id, this.type, this.lessonId, this.language, this.words, this.url);

  factory TheorizeObject.fromJson(Map<String, dynamic> json) =>
      _$TheorizeObjectFromJson(json);

  Map<String, dynamic> toJson() => _$TheorizeObjectToJson(this);
}

@JsonSerializable()
class TheoryWord {
  @JsonKey(name: "word_id")
  String? wordId;

  String? word;
  String? mean;
  String? audio;
  List<TheoryWordResult>? results;

  TheoryWord(this.wordId, this.word, this.mean, this.audio, this.results);

  factory TheoryWord.fromJson(Map<String, dynamic> json) =>
      _$TheoryWordFromJson(json);

  Map<String, dynamic> toJson() => _$TheoryWordToJson(this);

}

@JsonSerializable()
class TheoryWordResult {
  String? mean;
  String? content;

  TheoryWordResult(this.mean, this.content);

  factory TheoryWordResult.fromJson(Map<String, dynamic> json) =>
      _$TheoryWordResultFromJson(json);

  Map<String, dynamic> toJson() => _$TheoryWordResultToJson(this);
}