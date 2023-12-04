{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
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
      alexcvzz.vscode-sqlite
      alpha4.jsonl
      amodio.tsl-problem-matcher
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
      cezaraugusto.vscode-chrome-extesion-manifest-json-schema
      chenxuan.cargo-crate-completer
      christian-kohler.path-intellisense
      circlecodesolution.ccs-flutter-color
      codezombiech.gitignore
      csstools.postcss
      davidanson.vscode-markdownlint
      develiteio.api-blueprint-viewer
      dtsvet.vscode-wasm
      dustypomerleau.rust-syntax
      #eamodio.find-related
      eamodio.gitlens
      editorconfig.editorconfig
      esbenp.prettier-vscode
      foxundermoon.shell-format
      github.codespaces
      github.vscode-pull-request-github
      gruntfuggly.todo-tree
      hangxingliu.vscode-nginx-conf-hint
      hangxingliu.vscode-systemd-support
      hbenl.vscode-test-explorer
      hdevalke.rust-test-lens
      hediet.vscode-drawio
      humao.rest-client
      jakob101.relativepath
      jdinhlife.gruvbox
      jedeop.crates-completer
      jnoortheen.nix-ide
      jock.svg
      jscearcy.rust-doc-viewer
      leonardssh.vscord
      lokalise.i18n-ally
      lorenzopirro.rust-flash-snippets
      malmaud.tmux
      marus25.cortex-debug
      maziac.asm-code-lens
      mcu-debug.debug-tracker-vscode
      mcu-debug.memory-view
      mcu-debug.peripheral-viewer
      mcu-debug.rtos-views
      mikestead.dotenv
      mkhl.direnv
      mkornelsen.vscode-arm64
      ms-azuretools.vscode-docker
      ms-vscode-remote.remote-containers
      ms-vscode.hexeditor
      ms-vscode.live-server
      ms-vscode.mono-debug
      ms-vscode.remote-explorer
      ms-vscode.test-adapter-converter
      mwpb.java-prettier-formatter
      natizyskunk.sftp
      nhoizey.gremlins
      nico-castell.linux-desktop-file
      oderwat.indent-rainbow
      oouo-diogo-perdigao.docthis
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
      redhat.vscode-yaml
      rust-lang.rust-analyzer
      ryanluker.vscode-coverage-gutters
      serayuzgur.crates
      shyykoserhiy.vscode-spotify
      swellaby.rust-pack
      swellaby.vscode-rust-test-adapter
      tamasfe.even-better-toml
      tomoki1207.pdf
      unifiedjs.vscode-mdx
      usernamehw.errorlens
      vadimcn.vscode-lldb
      visualstudioexptteam.intellicode-api-usage-examples
      vncz.vscode-apielements
      webfreak.debug
      yukai.map-replace-js
      zhangyue.rust-mod-generator
      zixuanwang.linkerscript
    ];
  };
}
