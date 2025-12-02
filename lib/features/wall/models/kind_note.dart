class KindNote {
  final String id;
  final String text;
  final DateTime createdAt;
  final DateTime publishedAt;   // NEW: used for filtering
  final int hearts;
  final List<String> heartedBy; // NEW: track users who hearted

  KindNote({
    required this.id,
    required this.text,
    required this.createdAt,
    DateTime? publishedAt,              // optional, defaults to createdAt
    this.hearts = 0,
    this.heartedBy = const [],
  }) : publishedAt = publishedAt ?? createdAt;

  KindNote copyWith({
    String? id,
    String? text,
    DateTime? createdAt,
    DateTime? publishedAt,
    int? hearts,
    List<String>? heartedBy,
  }) {
    return KindNote(
      id: id ?? this.id,
      text: text ?? this.text,
      createdAt: createdAt ?? this.createdAt,
      publishedAt: publishedAt ?? this.publishedAt,
      hearts: hearts ?? this.hearts,
      heartedBy: heartedBy ?? this.heartedBy,
    );
  }
}