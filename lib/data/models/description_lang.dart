class Description {
  Description({
    required this.ar,
    required this.en,
  });

  String ar;
  String en;

  factory Description.fromJson(Map<String, dynamic> json) => Description(
        ar: json["ar"],
        en: json["en"],
      );

  Map<String, dynamic> toJson() => {
        "ar": ar,
        "en": en,
      };
}
