// Project imports:
import 'package:reddit_app/feature/data/models/children_model.dart';
import 'package:reddit_app/feature/domain/entitis/post_data_entiti.dart';

class PostDataModel extends PostDataEntiti {
  PostDataModel({
    required final List<ChildrenModel> children,
  }) : super(
          children: children,
        );
  factory PostDataModel.fromJson(Map<String, dynamic> json) => PostDataModel(
        children: List<ChildrenModel>.from((json['children'] as List<dynamic>)
            .map((json) => ChildrenModel.fromJson(json))
            .toList()),
      );
}
