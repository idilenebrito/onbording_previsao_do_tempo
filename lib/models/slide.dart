class Slide {
  final String animationPath;
  final String description;

  Slide({required this.animationPath, required this.description});
}

final slideListDark = [
  Slide(
      animationPath: 'weather-night-snow.json',
      description: "O seu app de previsão do tempo"),
  Slide(
      animationPath: 'weather-night-broken-clouds.json',
      description:
          "Nada melhor do que um dia ensolarado para o seu passeio preferido"),
  Slide(
      animationPath: 'weather-night-thunderstorm.json',
      description: "Vamos te lembrar para levar o casaco"),
];

final slideListLight = [
  Slide(
      animationPath: 'weather-day-snow.json',
      description: "O seu app de previsão do tempo"),
  Slide(
      animationPath: 'weather-day-broken-clouds.json',
      description:
          "Nada melhor do que um dia ensolarado para o seu passeio preferido"),
  Slide(
      animationPath: 'weather-day-thunderstorm.json',
      description: "Vamos te lembrar para levar o casaco"),
];
