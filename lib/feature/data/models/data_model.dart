// Project imports:
import 'package:reddit_app/feature/domain/entitis/data_entiti.dart';

class DataModel extends DataEntiti {
  DataModel({
    required final String thumbnail,
    required final String title,
    required final int like,
    required final String selfText,
    required final dynamic urlOverriddenByDest,
  }) : super(
          thumbnail: thumbnail,
          title: title,
          like: like,
          selfText: selfText,
          urlOverriddenByDest: urlOverriddenByDest,
        );
  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        thumbnail: json['thumbnail'] as String,
        title: json['title'] as String,
        like: json['ups'] as int,
        selfText: json['selftext'] as String,
        urlOverriddenByDest: json["url_overridden_by_dest"],
      );
}
