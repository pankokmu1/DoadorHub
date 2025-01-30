enum Gender {
  male('Masculino'),
  female('Feminino');

  final String name;
  const Gender(this.name);

  static Gender fromString(String value) {
    return Gender.values.firstWhere(
      (sex) => sex.name.toLowerCase() == value.toLowerCase(),
      orElse: () => throw ArgumentError('Invalid sex: $value'),
    );
  }
}
