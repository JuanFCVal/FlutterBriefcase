class Band {
  String id;
  String name;
  String? description;
  int votes;
  Band(
      {required this.id,
      required this.name,
      this.description,
      required this.votes});

  factory Band.fromJson(Map<String, dynamic> json) => Band(
        //Crea una instancia de la clase
        id: json["id"],
        name: json["name"],
        description: json["description"],
        votes: json["votes"],
      );
}
