# patches vivaldi to use proprietary codecs
_: prev: {
  vivaldi = prev.vivaldi.override {
    proprietaryCodecs = true;
    enableWidevine = true;
  };
}
