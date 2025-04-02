enum FyLocales {
  ptBR('R\$', 'pt_BR', '0,00'),
  enUS('\$', 'en_US', '0.00'), // Inglês dos EUA
  esES('€', 'es_ES', '0,00'), // Espanhol da Espanha
  frFR('€', 'fr_FR', '0,00'), // Francês da França
  deDE('€', 'de_DE', '0,00'), // Alemão da Alemanha
  itIT('€', 'it_IT', '0,00'), // Italiano da Itália
  jaJP('¥', 'ja_JP', '0'), // Japonês do Japão
  koKR('₩', 'ko_KR', '0'), // Coreano da Coreia do Sul
  zhCN('¥', 'zh_CN', '0.00'), // Chinês (mandarim) da China
  ruRU('₽', 'ru_RU', '0,00'), // Russo da Rússia
  arSA('﷼', 'ar_SA', '0.00'), // Árabe da Arábia Saudita
  ptPT('€', 'pt_PT', '0,00'), // Português de Portugal
  trTR('₺', 'tr_TR', '0,00'), // Turco da Turquia
  hiIN('₹', 'hi_IN', '0.00'), // Hindi da Índia
  viVN('₫', 'vi_VN', '0'), // Vietnamita do Vietnã
  thTH('฿', 'th_TH', '0.00'), // Tailandês da Tailândia
  idID('Rp', 'id_ID', '0,00'), // Indonésio da Indonésia
  msMY('RM', 'ms_MY', '0.00'), // Malaio da Malásia
  filPH('₱', 'fil_PH', '0.00'); // Filipino das Filipinas

  final String symbol;
  final String locale;
  final String emptyValue;

  const FyLocales(this.symbol, this.locale, this.emptyValue);
}
