import 'package:equatable/equatable.dart';

class Comment extends Equatable {
  const Comment({
    required this.id,
    required this.name,
    required this.email,
    required this.body
});

  final int id;
  final String name;
  final String email;
  final String body;

  @override
  List<Object> get props => [
    id,
  name,
    email,
    body
  ];
}
