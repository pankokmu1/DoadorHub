enum BloodType {
  aPositive('A+'),
  aNegative('A-'),
  bPositive('B+'),
  bNegative('B-'),
  abPositive('AB+'),
  abNegative('AB-'),
  oPositive('O+'),
  oNegative('O-');

  final String name;
  const BloodType(this.name);

  static BloodType fromString(String value) {
    return BloodType.values.firstWhere(
      (type) => type.name.toUpperCase() == value.toUpperCase(),
      orElse: () => throw ArgumentError('Invalid blood type: $value'),
    );
  }
}
