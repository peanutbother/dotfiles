# patches vivaldi to use proprietary codecs
final: prev: {
  vivaldi = prev.vivaldi.override {
    proprietaryCodecs = true;
    enableWidevine = true;
  };
}
