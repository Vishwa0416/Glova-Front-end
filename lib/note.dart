class Note{
  int id;
  String note;

//<editor-fold desc="Data Methods">
  Note({
    required this.id,
    required this.note,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Note &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          note == other.note);

  @override
  int get hashCode => id.hashCode ^ note.hashCode;

  @override
  String toString() {
    return 'Note{' + ' id: $id,' + ' note: $note,' + '}';
  }

  Note copyWith({
    int? id,
    String? note,
  }) {
    return Note(
      id: id ?? this.id,
      note: note ?? this.note,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'body': this.note,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'] as int,
      note: map['body'] as String,
    );
  }

//</editor-fold>
}