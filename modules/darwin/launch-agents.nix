{lib, user,...}: {
  environment.userLaunchAgents."com.${user}.login.ssh-add.plist" = {
    enable = lib.mkDefault true;
    text = ''
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
          <key>Label</key>
          <string>com.${user}.login.ssh-add</string>
          <key>ProgramArguments</key>
          <array>
              <string>ssh-add</string>
              <string>--apple-load-keychain</string>
          </array>
          <key>RunAtLoad</key>
          <true/>
          <key>ProcessType</key>
          <string>Interactive</string>
      </dict>
      </plist>
    '';
  };
}