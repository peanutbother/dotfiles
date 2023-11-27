# patches direnv to honor DIRENV_HIDE_DIFF setting to allow silencing ENV diffs

final: prev:
{
  direnv = prev.direnv.overrideAttrs (old: {
    patches = (old.patches or [ ]) ++ [
      (prev.fetchpatch {
        url = "https://github.com/direnv/direnv/commit/39856b6c266392aac08cdc25eb7f0c88b851fd1b.diff";
        hash = "sha256-jL6G7aTNpbnJ5eKd0/jOJY4LcvWxiSTnCfWCuHZnRW0=";
      })
    ];
  });
}
