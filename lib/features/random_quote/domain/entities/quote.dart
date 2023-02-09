import 'package:equatable/equatable.dart';

class Quote extends Equatable {
  final String author;
  final int id;
  final String content;

  // "id": 7,
  // "quote": "I’ve missed more than 9000 shots in my career. I’ve lost almost 300 games. 26 times I’ve been trusted to take the game winning shot and missed. I’ve failed over and over and over again in my life. And that is why I succeed.",
  // "author": "Michael Jordan"
  const Quote(
      {required this.author,
        required this.id,
        required this.content});

  @override
  List<Object?> get props => [author, id, content];
}
