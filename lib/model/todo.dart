class TODO {
  late int id;
  late String title;
  late bool isImportant;
  late String date;

  TODO({
    required this.id,
    required this.title,
    required this.isImportant,
    required this.date,
  });

  TODO.fromJson(Map<String, dynamic> data) {
    this.id = data['id'];
    this.title = data['title'];
    this.isImportant = data['isImportant'];
    this.date = data['date'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'isImportant': isImportant,
      'date': date,
    };
  }
}
