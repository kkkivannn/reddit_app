import 'package:reddit_app/feature/data/models/post_data_model.dart';
import 'package:reddit_app/feature/domain/entitis/post_entiti.dart';

class PostModel extends PostEntiti {
  PostModel({
    required final String kind,
    required final PostDataModel data,
  }) : super(
          kind: kind,
          data: data,
        );
  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        kind: json['kind'],
        data: PostDataModel.fromJson(json['data']),
      );
}
