enum AppFlavor {
  dev(1, "dev"),
  test(2, "test"),
  uat(3, "uat"),
  prod(4, "prod");

  final int id;
  final String text;
  const AppFlavor(
    this.id,
    this.text,
  );
}