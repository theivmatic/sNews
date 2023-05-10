// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllNewsEntity _$AllnewsFromJson(Map<String, dynamic> json) => AllNewsEntity(
      status: json['status'] as String?,
      copyright: json['copyright'] as String?,
      numResults: json['numResults'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Results.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Results _$ResultsFromJson(Map<String, dynamic> json) => Results(
      slugName: json['slugName'] as String?,
      section: json['section'] as String?,
      subsection: json['subsection'] as String?,
      title: json['title'] as String?,
      abstract: json['abstract'] as String?,
      uri: json['uri'] as String?,
      url: json['url'] as String?,
      byline: json['byline'] as String?,
      thumbnailStandard: json['thumbnailStandard'] as String?,
      itemType: json['itemType'] as String?,
      source: json['source'] as String?,
      updatedDate: json['updatedDate'] as String?,
      createdDate: json['createdDate'] as String?,
      publishedDate: json['publishedDate'] as String?,
      firstPublishedDate: json['firstPublishedDate'] as String?,
      materialTypeFacet: json['materialTypeFacet'] as String?,
      kicker: json['kicker'] as String?,
      subheadline: json['subheadline'] as String?,
      desFacet: (json['desFacet'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      orgFacet: (json['orgFacet'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      perFacet: (json['perFacet'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      geoFacet: json['geoFacet'],
      relatedUrls: json['relatedUrls'],
      multimedia: (json['multimedia'] as List<dynamic>?)
          ?.map((e) => Multimedia.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Multimedia _$MultimediaFromJson(Map<String, dynamic> json) => Multimedia(
      url: json['url'] as String?,
      format: json['format'] as String?,
      height: json['height'] as int?,
      width: json['width'] as int?,
      type: json['type'] as String?,
      subtype: json['subtype'] as String?,
      caption: json['caption'] as String?,
      copyright: json['copyright'] as String?,
    );
