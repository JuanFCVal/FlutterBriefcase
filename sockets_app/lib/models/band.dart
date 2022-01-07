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
        id: json.containsKey('id') ? json["id"] : "no-id",
        name: json.containsKey('name') ? json["name"] : "no-name",
        description:
            json.containsKey('name') ? json["description"] : "no- description",
        votes: json.containsKey('votes') ? json["votes"] : 0,
      );
}
