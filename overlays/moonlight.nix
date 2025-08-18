inputs: final: prev: let
  moonlight = inputs.moonlight.packages.${final.system}.moonlight;
in {
  moonlight = prev.discord.override {
    withMoonlight = true;
    inherit moonlight;
  };
}
