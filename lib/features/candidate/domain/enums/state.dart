enum State {
  acre('AC'),
  alagoas('AL'),
  amapa('AP'),
  amazonas('AM'),
  bahia('BA'),
  ceara('CE'),
  distritoFederal('DF'),
  espiritoSanto('ES'),
  goias('GO'),
  maranhao('MA'),
  matoGrosso('MT'),
  matoGrossoDoSul('MS'),
  minasGerais('MG'),
  para('PA'),
  paraiba('PB'),
  parana('PR'),
  pernambuco('PE'),
  piaui('PI'),
  rioDeJaneiro('RJ'),
  rioGrandeDoNorte('RN'),
  rioGrandeDoSul('RS'),
  rondonia('RO'),
  roraima('RR'),
  santaCatarina('SC'),
  saoPaulo('SP'),
  sergipe('SE'),
  tocantins('TO');

  final String name;
  const State(this.name);

  static State fromString(String value) {
    return State.values.firstWhere(
      (state) => state.name.toUpperCase() == value.toUpperCase(),
      orElse: () => throw ArgumentError('Invalid state: $value'),
    );
  }
}
