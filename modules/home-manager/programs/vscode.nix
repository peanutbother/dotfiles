{ lib, pkgs, ... }:
{
  programs.vscode = {
    enable = lib.mkDefault true;
    package = pkgs.vscode.fhsWithPackages (ps: with ps; [
      rustup
      zlib
      openssl.dev
      pkg-config

      niv
      nixpkgs-fmt
      nixd
      statix
      vulnix
    ]);
    userSettings = {
      "editor.fontFamily" = "FiraCode Nerd Font";
      "terminal.integrated.fontFamily" = "FiraMono Nerd Font";
      "editor.fontLigatures" = true;
    };
    keybindings =
      let
        modifier = if pkgs.stdenv.hostPlatform.isDarwin then "cmd" else "ctrl";
      in
      [
        {
          key = "${modifier}+n";
          command = "explorer.newFile";
        }
        {
          key = "shift+${modifier}+n";
          command = "explorer.newFolder";
        }
        {
          key = "shift+alt+n";
          command = "rust-mod-generator.createRustMod";
        }
      ];
    extensions = with pkgs.vscode-marketplace; [
      a5huynh.vscode-ron
      ahmadalli.vscode-nginx-conf
      alexcvzz.vscode-sqlite
      alpha4.jsonl
      anseki.vscode-color
      arcanis.vscode-zipfs
      arrterian.nix-env-selector
      bierner.color-info
      bierner.github-markdown-preview
      bierner.markdown-checkbox
      bierner.markdown-emoji
      bierner.markdown-footnotes
      bierner.markdown-mermaid
      bierner.markdown-preview-github-styles
      bierner.markdown-yaml-preamble
      bradlc.vscode-tailwindcss
      cezaraugusto.vscode-chrome-extesion-manifest-json-schema
      chenxuan.cargo-crate-completer
      christian-kohler.npm-intellisense
      christian-kohler.path-intellisense
      codezombiech.gitignore
      csstools.postcss
      davidanson.vscode-markdownlint
      develiteio.api-blueprint-viewer
      dotjoshjohnson.xml
      dtsvet.vscode-wasm
      dustypomerleau.rust-syntax
      #eamodio.find-related
      eamodio.gitlens
      editorconfig.editorconfig
      esbenp.prettier-vscode
      fivepointseven.node-version
      foxundermoon.shell-format
      github.codespaces
      github.vscode-pull-request-github
      gruntfuggly.todo-tree
      hangxingliu.vscode-nginx-conf-hint
      hangxingliu.vscode-systemd-support
      hbenl.vscode-test-explorer
      hdevalke.rust-test-lens
      hediet.vscode-drawio
      heybourn.headwind
      humao.rest-client
      icrawl.discord-vscode
      irongeek.vscode-env
      jakob101.relativepath
      jdinhlife.gruvbox
      jedeop.crates-completer
      jnoortheen.nix-ide
      jock.svg
      jscearcy.rust-doc-viewer
      lokalise.i18n-ally
      lorenzopirro.rust-flash-snippets
      malmaud.tmux
      marus25.cortex-debug
      maziac.asm-code-lens
      mcu-debug.debug-tracker-vscode
      mcu-debug.memory-view
      mcu-debug.peripheral-viewer
      mcu-debug.rtos-views
      mike-co.import-sorter
      mikestead.dotenv
      mkhl.direnv
      mkornelsen.vscode-arm64
      mrmlnc.vscode-scss
      ms-azuretools.vscode-docker
      ms-vscode-remote.remote-containers
      ms-vscode-remote.remote-ssh
      ms-vscode-remote.remote-ssh-edit
      ms-vscode-remote.remote-wsl
      ms-vscode.hexeditor
      ms-vscode.live-server
      ms-vscode.mono-debug
      ms-vscode.remote-explorer
      ms-vscode.test-adapter-converter
      natizyskunk.sftp
      nhoizey.gremlins
      nico-castell.linux-desktop-file
      oderwat.indent-rainbow
      oouo-diogo-perdigao.docthis
      ottostreifel.typescript-uml
      p1c2u.docker-compose
      panicbit.cargo
      peterschmalfeldt.explorer-exclude
      pflannery.vscode-versionlens
      pkief.material-icon-theme
      pkief.material-product-icons
      polymeilex.rust-targets
      probe-rs.probe-rs-debugger
      quicktype.quicktype
      qwtel.sqlite-viewer
      rafaelmaiolla.diff
      raynigon.nginx-formatter
      redhat.vscode-yaml
      rust-lang.rust-analyzer
      ryanluker.vscode-coverage-gutters
      serayuzgur.crates
      shyykoserhiy.vscode-spotify
      statiolake.vscode-rustfmt
      streetsidesoftware.code-spell-checker
      swellaby.rust-pack
      swellaby.vscode-rust-test-adapter
      tamasfe.even-better-toml
      tomoki1207.pdf
      unifiedjs.vscode-mdx
      usernamehw.errorlens
      vadimcn.vscode-lldb
      visualstudioexptteam.vscodeintellicode-completions
      vncz.vscode-apielements
      webfreak.debug
      yukai.map-replace-js
      zhangyue.rust-mod-generator
      zixuanwang.linkerscript
    ];
  };
}
