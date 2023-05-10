import 'package:flutter/foundation.dart';

part 'all_news.g.dart';

class Allnews {
  String? status;
  String? copyright;
  int? numResults;
  List<Results>? results;

  Allnews({this.status, this.copyright, this.numResults, this.results});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["copyright"] = copyright;
    _data["num_results"] = numResults;
    if(results != null) {
      _data["results"] = results?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
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

  Results({this.slugName, this.section, this.subsection, this.title, this.abstract, this.uri, this.url, this.byline, this.thumbnailStandard, this.itemType, this.source, this.updatedDate, this.createdDate, this.publishedDate, this.firstPublishedDate, this.materialTypeFacet, this.kicker, this.subheadline, this.desFacet, this.orgFacet, this.perFacet, this.geoFacet, this.relatedUrls, this.multimedia});

  Results.fromJson(Map<String, dynamic> json) {
    slugName = json["slug_name"];
    section = json["section"];
    subsection = json["subsection"];
    title = json["title"];
    abstract = json["abstract"];
    uri = json["uri"];
    url = json["url"];
    byline = json["byline"];
    thumbnailStandard = json["thumbnail_standard"];
    itemType = json["item_type"];
    source = json["source"];
    updatedDate = json["updated_date"];
    createdDate = json["created_date"];
    publishedDate = json["published_date"];
    firstPublishedDate = json["first_published_date"];
    materialTypeFacet = json["material_type_facet"];
    kicker = json["kicker"];
    subheadline = json["subheadline"];
    desFacet = json["des_facet"] == null ? null : List<String>.from(json["des_facet"]);
    orgFacet = json["org_facet"] == null ? null : List<String>.from(json["org_facet"]);
    perFacet = json["per_facet"] == null ? null : List<String>.from(json["per_facet"]);
    geoFacet = json["geo_facet"];
    relatedUrls = json["related_urls"];
    multimedia = json["multimedia"] == null ? null : (json["multimedia"] as List).map((e) => Multimedia.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["slug_name"] = slugName;
    _data["section"] = section;
    _data["subsection"] = subsection;
    _data["title"] = title;
    _data["abstract"] = abstract;
    _data["uri"] = uri;
    _data["url"] = url;
    _data["byline"] = byline;
    _data["thumbnail_standard"] = thumbnailStandard;
    _data["item_type"] = itemType;
    _data["source"] = source;
    _data["updated_date"] = updatedDate;
    _data["created_date"] = createdDate;
    _data["published_date"] = publishedDate;
    _data["first_published_date"] = firstPublishedDate;
    _data["material_type_facet"] = materialTypeFacet;
    _data["kicker"] = kicker;
    _data["subheadline"] = subheadline;
    if(desFacet != null) {
      _data["des_facet"] = desFacet;
    }
    if(orgFacet != null) {
      _data["org_facet"] = orgFacet;
    }
    if(perFacet != null) {
      _data["per_facet"] = perFacet;
    }
    _data["geo_facet"] = geoFacet;
    _data["related_urls"] = relatedUrls;
    if(multimedia != null) {
      _data["multimedia"] = multimedia?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
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

  Multimedia({this.url, this.format, this.height, this.width, this.type, this.subtype, this.caption, this.copyright});

  Multimedia.fromJson(Map<String, dynamic> json) {
    url = json["url"];
    format = json["format"];
    height = json["height"];
    width = json["width"];
    type = json["type"];
    subtype = json["subtype"];
    caption = json["caption"];
    copyright = json["copyright"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["url"] = url;
    _data["format"] = format;
    _data["height"] = height;
    _data["width"] = width;
    _data["type"] = type;
    _data["subtype"] = subtype;
    _data["caption"] = caption;
    _data["copyright"] = copyright;
    return _data;
  }
}