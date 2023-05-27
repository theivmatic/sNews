// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_news_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllNewsEntity _$AllNewsEntityFromJson(Map<String, dynamic> json) =>
    AllNewsEntity(
      status: json['status'] as String?,
      copyright: json['copyright'] as String?,
      response: json['response'] == null
          ? null
          : Response.fromJson(json['response'] as Map<String, dynamic>),
    );

Byline _$BylineFromJson(Map<String, dynamic> json) => Byline(
      original: json['original'] as String?,
      person: (json['person'] as List<dynamic>?)
          ?.map((e) => Person.fromJson(e as Map<String, dynamic>))
          .toList(),
      organization: json['organization'],
    );

Doc _$DocFromJson(Map<String, dynamic> json) => Doc(
      abstract: json['abstract'] as String?,
      webUrl: json['webUrl'] as String?,
      snippet: json['snippet'] as String?,
      leadParagraph: json['leadParagraph'] as String?,
      printSection: json['printSection'] as String?,
      printPage: json['printPage'] as String?,
      source: json['source'] as String?,
      multimedia: (json['multimedia'] as List<dynamic>?)
          ?.map((e) => Multimedia.fromJson(e as Map<String, dynamic>))
          .toList(),
      headline: json['headline'] == null
          ? null
          : Headline.fromJson(json['headline'] as Map<String, dynamic>),
      keywords: (json['keywords'] as List<dynamic>?)
          ?.map((e) => Keyword.fromJson(e as Map<String, dynamic>))
          .toList(),
      pubDate: json['pubDate'] as String?,
      documentType: json['documentType'] as String?,
      newsDesk: json['newsDesk'] as String?,
      sectionName: json['sectionName'] as String?,
      subsectionName: json['subsectionName'] as String?,
      byline: json['byline'] == null
          ? null
          : Byline.fromJson(json['byline'] as Map<String, dynamic>),
      typeOfMaterial: json['typeOfMaterial'] as String?,
      id: json['id'] as String?,
      wordCount: json['wordCount'] as int?,
      uri: json['uri'] as String?,
    );

Headline _$HeadlineFromJson(Map<String, dynamic> json) => Headline(
      main: json['main'] as String?,
      kicker: json['kicker'],
      contentKicker: json['contentKicker'],
      printHeadline: json['printHeadline'] as String?,
      name: json['name'],
      seo: json['seo'],
      sub: json['sub'],
    );

Keyword _$KeywordFromJson(Map<String, dynamic> json) => Keyword(
      name: json['name'] as String?,
      value: json['value'] as String?,
      rank: json['rank'] as int?,
      major: json['major'] as String?,
    );

Legacy _$LegacyFromJson(Map<String, dynamic> json) => Legacy(
      xlarge: json['xlarge'] as String?,
      xlargewidth: json['xlargewidth'] as int?,
      xlargeheight: json['xlargeheight'] as int?,
    );

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      hits: json['hits'] as int?,
      offset: json['offset'] as int?,
      time: json['time'] as int?,
    );

Multimedia _$MultimediaFromJson(Map<String, dynamic> json) => Multimedia(
      rank: json['rank'] as int?,
      subtype: json['subtype'] as String?,
      caption: json['caption'],
      credit: json['credit'],
      type: json['type'] as String?,
      url: json['url'] as String?,
      height: json['height'] as int?,
      width: json['width'] as int?,
      legacy: json['legacy'] == null
          ? null
          : Legacy.fromJson(json['legacy'] as Map<String, dynamic>),
      subType: json['subType'] as String?,
      cropName: json['cropName'] as String?,
    );

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
      firstname: json['firstname'] as String?,
      middlename: json['middlename'],
      lastname: json['lastname'] as String?,
      qualifier: json['qualifier'],
      title: json['title'],
      role: json['role'] as String?,
      organization: json['organization'] as String?,
      rank: json['rank'] as int?,
    );

Response _$ResponseFromJson(Map<String, dynamic> json) => Response(
      docs: (json['docs'] as List<dynamic>?)
          ?.map((e) => Doc.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );
