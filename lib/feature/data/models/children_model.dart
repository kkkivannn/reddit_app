import 'package:reddit_app/feature/data/models/data_model.dart';
import 'package:reddit_app/feature/domain/entitis/children_entiti.dart';
import 'package:reddit_app/feature/domain/entitis/data_entiti.dart';

class ChildrenModel extends ChildrenEntiti {
  ChildrenModel({
    required final DataEntiti data,
  }) : super(
          data: data,
        );
  factory ChildrenModel.fromJson(Map<String, dynamic> json) => ChildrenModel(
        data: DataModel.fromJson(
          json['data'],
        ),
      );
}
