import 'dart:convert';

QuestionsStore questionsStoreFromJson(String str) =>
    QuestionsStore.fromJson(json.decode(str));

String questionsStoreToJson(QuestionsStore data) => json.encode(data.toJson());

class QuestionsStore {
  QuestionsStore({
    required this.name,
    required this.total,
    required this.questions,
    required this.thumbnail,
    required this.reputation,
  });

  final String name;
  final int total;
  final List<Question> questions;
  final String thumbnail;
  final String reputation;

  factory QuestionsStore.fromJson(Map<String, dynamic> json) => QuestionsStore(
        name: json["name"] ?? '',
        total: json["total"] ?? 0,
        questions: json["questions"] == null
            ? []
            : List<Question>.from(
                json["questions"].map((x) => Question.fromJson(x))),
        thumbnail: json["thumbnail"] ?? '',
        reputation: json["reputation"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "total": total,
        "questions": questions,
        "thumbnail": thumbnail,
        "reputation": reputation,
      };
}

class Question {
  Question({
    required this.dateCreated,
    required this.itemId,
    required this.sellerId,
    required this.status,
    required this.text,
    required this.tags,
    required this.id,
    required this.deletedFromListing,
    required this.hold,
    required this.answer,
    required this.from,
    required this.thumbnail,
  });

  final String dateCreated;
  final String itemId;
  final int sellerId;
  final String status;
  final String text;
  final List<dynamic> tags;
  final int id;
  final bool deletedFromListing;
  final bool hold;
  final dynamic answer;
  final From from;
  final String thumbnail;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        dateCreated:
            json["date_created"] == null ? '' : json["date_created"].toString(),
        itemId: json["item_id"] ?? 'No registro',
        sellerId: json["seller_id"] ?? 0,
        status: json["status"] ?? ' No registro',
        text: json["text"] ?? 'No registros',
        tags: json["tags"] == null
            ? []
            : List<dynamic>.from(json["tags"].map((x) => x)),
        id: json["id"] ?? 0,
        deletedFromListing: json["deleted_from_listing"] ?? false,
        hold: json["hold"] ?? false,
        answer: json["answer"],
        from: json["from"] == null ? From(id: 0) : From.fromJson(json["from"]),
        thumbnail: json["thumbnail"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "date_created": dateCreated,
        "item_id": itemId,
        "seller_id": sellerId,
        "status": status,
        "text": text,
        "tags": tags,
        "id": id,
        "deleted_from_listing": deletedFromListing,
        "hold": hold,
        "answer": answer,
        "from": from,
        "thumbnail": thumbnail,
      };
}

class From {
  From({
    required this.id,
  });

  final int id;

  factory From.fromJson(Map<String, dynamic> json) => From(
        id: json["id"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
