class Tuple2<A, B> {
  final A a;
  final B b;

  Tuple2(this.a, this.b);

  Tuple2<A,B> copyWith({
    A? a,
    B? b,
  }) {
    return Tuple2(
      a ?? this.a,
      b ?? this.b,
    );
  }
}
