import 'package:json_annotation/json_annotation.dart';
part 'news.g.dart';

@JsonSerializable()
class NewsEntity {
  String? status;
  String? copyright;
  String? section;
  String? lastUpdated;
  int? numResults;
  List<Result>? results;

  NewsEntity({
    this.status,
    this.copyright,
    this.section,
    this.lastUpdated,
    this.numResults,
    this.results,
  });

  factory NewsEntity.fromJson(Map<String, dynamic> json) =>
      _$AllNewsEntityFromJson(json);
}

@JsonSerializable()
class Multimedia {
  String? url;
  String? format;
  int? height;
  int? width;
  String? type;
  String? subtype;
  String? caption;
  String? copyright;

  Multimedia({
    this.url,
    this.format,
    this.height,
    this.width,
    this.type,
    this.subtype,
    this.caption,
    this.copyright,
  });

  factory Multimedia.fromJson(Map<String, dynamic> json) =>
      _$MultimediaFromJson(json);
}

@JsonSerializable()
class Result {
  String? section;
  String? subsection;
  String? title;
  String? abstract;
  String? url;
  String? uri;
  String? byline;
  String? itemType;
  String? updatedDate;
  String? createdDate;
  String? publishedDate;
  String? materialTypeFacet;
  String? kicker;
  List<String>? desFacet;
  List<String>? orgFacet;
  List<String>? perFacet;
  List<dynamic>? geoFacet;
  List<Multimedia>? multimedia;
  String? shortUrl;

  Result({
    this.section,
    this.subsection,
    this.title,
    this.abstract,
    this.url,
    this.uri,
    this.byline,
    this.itemType,
    this.updatedDate,
    this.createdDate,
    this.publishedDate,
    this.materialTypeFacet,
    this.kicker,
    this.desFacet,
    this.orgFacet,
    this.perFacet,
    this.geoFacet,
    this.multimedia,
    this.shortUrl,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
