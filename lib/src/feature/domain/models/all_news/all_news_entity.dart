import 'package:json_annotation/json_annotation.dart';
part 'all_news_entity.g.dart';

@JsonSerializable()
class AllNewsEntity {
  String? status;
  String? copyright;
  Response? response;

  AllNewsEntity({this.status, this.copyright, this.response});

  factory AllNewsEntity.fromJson(Map<String, dynamic> json) =>
      _$AllNewsEntityFromJson(json);
}

@JsonSerializable()
class Byline {
  String? original;
  List<Person>? person;
  dynamic organization;

  Byline({this.original, this.person, this.organization});

  factory Byline.fromJson(Map<String, dynamic> json) => _$BylineFromJson(json);
}

@JsonSerializable()
class Doc {
  String? abstract;
  String? webUrl;
  String? snippet;
  String? leadParagraph;
  String? printSection;
  String? printPage;
  String? source;
  List<Multimedia>? multimedia;
  Headline? headline;
  List<Keyword>? keywords;
  String? pubDate;
  String? documentType;
  String? newsDesk;
  String? sectionName;
  String? subsectionName;
  Byline? byline;
  String? typeOfMaterial;
  String? id;
  int? wordCount;
  String? uri;

  Doc({
    this.abstract,
    this.webUrl,
    this.snippet,
    this.leadParagraph,
    this.printSection,
    this.printPage,
    this.source,
    this.multimedia,
    this.headline,
    this.keywords,
    this.pubDate,
    this.documentType,
    this.newsDesk,
    this.sectionName,
    this.subsectionName,
    this.byline,
    this.typeOfMaterial,
    this.id,
    this.wordCount,
    this.uri,
  });

  factory Doc.fromJson(Map<String, dynamic> json) => _$DocFromJson(json);
}

@JsonSerializable()
class Headline {
  String? main;
  dynamic kicker;
  dynamic contentKicker;
  String? printHeadline;
  dynamic name;
  dynamic seo;
  dynamic sub;

  Headline({
    this.main,
    this.kicker,
    this.contentKicker,
    this.printHeadline,
    this.name,
    this.seo,
    this.sub,
  });

  factory Headline.fromJson(Map<String, dynamic> json) =>
      _$HeadlineFromJson(json);
}

@JsonSerializable()
class Keyword {
  String? name;
  String? value;
  int? rank;
  String? major;

  Keyword({this.name, this.value, this.rank, this.major});

  factory Keyword.fromJson(Map<String, dynamic> json) =>
      _$KeywordFromJson(json);
}

@JsonSerializable()
class Legacy {
  String? xlarge;
  int? xlargewidth;
  int? xlargeheight;

  Legacy({this.xlarge, this.xlargewidth, this.xlargeheight});

  factory Legacy.fromJson(Map<String, dynamic> json) => _$LegacyFromJson(json);
}

@JsonSerializable()
class Meta {
  int? hits;
  int? offset;
  int? time;

  Meta({this.hits, this.offset, this.time});

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}

@JsonSerializable()
class Multimedia {
  int? rank;
  String? subtype;
  dynamic caption;
  dynamic credit;
  String? type;
  String? url;
  int? height;
  int? width;
  Legacy? legacy;
  String? subType;
  String? cropName;

  Multimedia({
    this.rank,
    this.subtype,
    this.caption,
    this.credit,
    this.type,
    this.url,
    this.height,
    this.width,
    this.legacy,
    this.subType,
    this.cropName,
  });

  factory Multimedia.fromJson(Map<String, dynamic> json) =>
      _$MultimediaFromJson(json);
}

@JsonSerializable()
class Person {
  String? firstname;
  dynamic middlename;
  String? lastname;
  dynamic qualifier;
  dynamic title;
  String? role;
  String? organization;
  int? rank;

  Person({
    this.firstname,
    this.middlename,
    this.lastname,
    this.qualifier,
    this.title,
    this.role,
    this.organization,
    this.rank,
  });

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
}

@JsonSerializable()
class Response {
  List<Doc>? docs;
  Meta? meta;

  Response({this.docs, this.meta});

  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);
}
