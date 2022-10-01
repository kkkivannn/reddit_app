// Project imports:
import 'package:reddit_app/feature/domain/entitis/data_entiti.dart';

class DataModel extends DataEntiti {
  DataModel({
    required final String thumbnail,
    required final String title,
  }) : super(
          thumbnail: thumbnail,
          title: title,
        );
  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        thumbnail: json['thumbnail'],
        title: json['title'],
      );
}
