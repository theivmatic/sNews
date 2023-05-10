part 'all_news.g.dart';

class AllNewsEntity {
  String? status;
  String? copyright;
  int? numResults;
  List<Results>? results;

  AllNewsEntity({this.status, this.copyright, this.numResults, this.results});

  factory AllNewsEntity.fromJson(Map<String, dynamic> json) =>
      _$AllnewsFromJson(json);
}

class Results {
  String? slugName;
  String? section;
  String? subsection;
  String? title;
  String? abstract;
  String? uri;
  String? url;
  String? byline;
  String? thumbnailStandard;
  String? itemType;
  String? source;
  String? updatedDate;
  String? createdDate;
  String? publishedDate;
  String? firstPublishedDate;
  String? materialTypeFacet;
  String? kicker;
  String? subheadline;
  List<String>? desFacet;
  List<String>? orgFacet;
  List<String>? perFacet;
  dynamic geoFacet;
  dynamic relatedUrls;
  List<Multimedia>? multimedia;

  Results({
    this.slugName,
    this.section,
    this.subsection,
    this.title,
    this.abstract,
    this.uri,
    this.url,
    this.byline,
    this.thumbnailStandard,
    this.itemType,
    this.source,
    this.updatedDate,
    this.createdDate,
    this.publishedDate,
    this.firstPublishedDate,
    this.materialTypeFacet,
    this.kicker,
    this.subheadline,
    this.desFacet,
    this.orgFacet,
    this.perFacet,
    this.geoFacet,
    this.relatedUrls,
    this.multimedia,
  });

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);
}

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
