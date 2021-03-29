enum Gender {
  masculine, feminine, neutral
}

class Word {
  final String value;
  final String translation;
  final int level;

  Word(this.level, this.value, this.translation);
}

class Verb extends Word {
  final String firstSingular;
  final String secondSingular;
  final String thirdSingular;
  final String firstPlural;
  final String secondPlural;
  final String thirdPlural;

  Verb(int level, String value, String translation, this.firstSingular, this.secondSingular, this.thirdSingular, this.firstPlural, this.secondPlural, this.thirdPlural)
      : super(level, value, translation);
}

class Noun extends Word {
  final Gender gender;
  final String plural;

  Noun(int level, String value, String translation,this.gender, this.plural)
      : super(level, value, translation);
}