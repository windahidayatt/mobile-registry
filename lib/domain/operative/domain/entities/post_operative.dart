import 'package:equatable/equatable.dart';
import 'package:mobile_registry/domain/operative/data/models/post_operative_response_dto.dart';

class PostOperative extends Equatable {
  final int id;
  final String name;
  final String domainCaseName;
  final String hospital;
  final String management;
  final String gender;

  const PostOperative({
    required this.id,
    required this.name,
    required this.domainCaseName,
    required this.hospital,
    required this.management,
    required this.gender,
  });

  factory PostOperative.fromDTO(PostOperativeResponseDTO dto) => PostOperative(
    id: dto.id,
    name: dto.name,
    domainCaseName: dto.domainCaseName,
    hospital: dto.hospital,
    management: dto.management,
    gender: dto.gender,
      );

  @override
  List<Object> get props => [];
}
