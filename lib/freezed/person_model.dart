
import 'package:freezed_annotation/freezed_annotation.dart';
part 'person_model.freezed.dart';
part 'person_model.g.dart';
@Freezed()
class PersonModel with _$PersonModel {

  factory PersonModel({
   @Default('') String? name,
})= _PersonModel;

  factory PersonModel.fromJson(Map<String, dynamic> json) =>
      _$PersonModelFromJson(json);

  @override
  // TODO: implement name
  String? get name => '';

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }


}