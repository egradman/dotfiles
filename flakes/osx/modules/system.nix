{ pkgs, ... }:

  ###################################################################################
  #
  #  macOS's System configuration
  #
  #  All the configuration options are documented here:
  #    https://daiderd.com/nix-darwin/manual/index.html#sec-options
  #
  ###################################################################################
{
  system = {
    stateVersion = 5;
    # activationScripts are executed every time you boot the system or run `nixos-rebuild` / `darwin-rebuild`.
    activationScripts.postUserActivation.text = ''
      # activateSettings -u will reload the settings from the database and apply them to the current session,
      # so we do not need to logout and login again to make the changes take effect.
      /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
    '';

    defaults = {
      menuExtraClock.Show24Hour = true;  # show 24 hour clock
      dock.autohide = true;

      # other macOS's defaults configuration.
      # ......
    };
    defaults.CustomUserPreferences = {
      "com.apple.symbolichotkeys" = {
        AppleSymbolicHotKeys = let
            disabled = { enabled = false; value = { parameters = []; type = "standard"; }; };
        in {
           "27" = {
              enabled = true;
              value = {
                parameters = [
                 96
                 50
                 1048576
                ];
                type = "standard";
              };
            };

           "28" = {
              enabled = true;
              value = {
                parameters = [
                    51
                    20
                    1179648
                ];
                type = "standard";
              };
            };

           "29" = {
              enabled = true;
              value = {
                parameters = [
                    51
                    20
                    1441792

                ];
                type = "standard";
              };
            };

           "30" = {
              enabled = true;
              value = {
                parameters = [
                    52
                    21
                    1179648

                ];
                type = "standard";
              };
            };

           "31" = {
              enabled = true;
              value = {
                parameters = [
                    52
                    21
                    1441792
                ];
                type = "standard";
              };
            };

           "32" = {
              enabled = false;
              value = {
                parameters = [
                    9
                    49
                    1048576
                ];
                type = "standard";
              };
            };

            # Others that we want disabled
            #"0" =   disabled;
            #"1" =   disabled;
            #"2" =   disabled;
            #"3" =   disabled;
            #"4" =   disabled;
            #"5" =   disabled;
            #"6" =   disabled;
            #"7" =   disabled;
            #"8" =   disabled;
            #"9" =   disabled;
            #"10" =  disabled;
            #"11" =  disabled;
            #"12" =  disabled;
            #"13" =  disabled;
            #"14" =  disabled;
            #"15" =  disabled;
            #"16" =  disabled;
            #"17" =  disabled;
            #"18" =  disabled;
            #"19" =  disabled;
            #"20" =  disabled;
            #"21" =  disabled;
            #"22" =  disabled;
            #"23" =  disabled;
            #"24" =  disabled;
            #"25" =  disabled;
            #"26" =  disabled;

            #"33" =  disabled;
            #"34" =  disabled;
            #"35" =  disabled;
            #"36" =  disabled;
            #"37" =  disabled;
            #"38" =  disabled;
            #"39" =  disabled;
            #"40" =  disabled;
            #"41" =  disabled;
            #"42" =  disabled;
            #"43" =  disabled;
            #"44" =  disabled;
            #"45" =  disabled;
            #"46" =  disabled;
            #"47" =  disabled;
            #"48" =  disabled;
            #"49" =  disabled;
            #"50" =  disabled;
            #"51" =  disabled;
            #"52" =  disabled;
            #"53" =  disabled;
            #"54" =  disabled;
            #"55" =  disabled;
            #"56" =  disabled;
            #"57" =  disabled;
            #"58" =  disabled;
            #"59" =  disabled;
            #"60" =  disabled;
            #"61" =  disabled;
            #"62" =  disabled;
            #"63" =  disabled;
            "64" =  disabled;
            #"65" =  disabled;
            #"66" =  disabled;
            #"67" =  disabled;
            #"68" =  disabled;
            #"69" =  disabled;
            #"70" =  disabled;
            #"71" =  disabled;
            #"72" =  disabled;
            #"73" =  disabled;
            #"74" =  disabled;
            #"75" =  disabled;
            #"76" =  disabled;
            #"77" =  disabled;
            #"78" =  disabled;
            #"79" =  disabled;
            #"80" =  disabled;
            #"81" =  disabled;
            #"82" =  disabled;
            #"83" =  disabled;
            #"84" =  disabled;
            #"85" =  disabled;
            #"86" =  disabled;
            #"87" =  disabled;
            #"88" =  disabled;
            #"89" =  disabled;
            #"90" =  disabled;
            #"91" =  disabled;
            #"92" =  disabled;
            #"93" =  disabled;
            #"94" =  disabled;
            #"95" =  disabled;
            #"96" =  disabled;
            #"97" =  disabled;
            #"98" =  disabled;
            #"99" =  disabled;
            #"100" = disabled;
            #"101" = disabled;
            #"102" = disabled;
            #"103" = disabled;
            #"104" = disabled;
            #"105" = disabled;
            #"106" = disabled;
            #"107" = disabled;
            #"108" = disabled;
            #"109" = disabled;
            #"110" = disabled;
            #"111" = disabled;
            #"112" = disabled;
            #"113" = disabled;
            #"114" = disabled;
            #"115" = disabled;
            #"116" = disabled;
            #"117" = disabled;
            #"118" = disabled;
            #"119" = disabled;
            #"120" = disabled;
            #"121" = disabled;
            #"122" = disabled;
            #"123" = disabled;
            #"124" = disabled;
            #"125" = disabled;
            #"126" = disabled;
            #"127" = disabled;
            #"128" = disabled;
            #"129" = disabled;
            #"130" = disabled;
            #"131" = disabled;
            #"132" = disabled;
            #"133" = disabled;
            #"134" = disabled;
            #"135" = disabled;
            #"136" = disabled;
            #"137" = disabled;
            #"138" = disabled;
            #"139" = disabled;
            #"140" = disabled;
            #"141" = disabled;
            #"142" = disabled;
            #"143" = disabled;
            #"144" = disabled;
            #"145" = disabled;
            #"146" = disabled;
            #"147" = disabled;
            #"148" = disabled;
            #"149" = disabled;
            #"150" = disabled;
            #"151" = disabled;
            #"152" = disabled;
            #"153" = disabled;
            #"154" = disabled;
            #"155" = disabled;
            #"156" = disabled;
            #"157" = disabled;
            #"158" = disabled;
            #"159" = disabled;
            #"160" = disabled;
            #"161" = disabled;
            #"162" = disabled;
            #"163" = disabled;
            #"164" = disabled;
            #"165" = disabled;
            #"166" = disabled;
            #"167" = disabled;
            #"168" = disabled;
            #"169" = disabled;
            #"170" = disabled;
            #"171" = disabled;
            #"172" = disabled;
            #"173" = disabled;
            #"174" = disabled;
            #"175" = disabled;
            #"176" = disabled;
            #"177" = disabled;
            #"178" = disabled;
            #"179" = disabled;
            #"180" = disabled;
            #"181" = disabled;
            #"182" = disabled;
            #"183" = disabled;
            #"184" = disabled;
            #"185" = disabled;
            #"186" = disabled;
            #"187" = disabled;
            #"188" = disabled;
            #"189" = disabled;
            #"190" = disabled;
            #"191" = disabled;
            #"192" = disabled;
            #"193" = disabled;
            #"194" = disabled;
            #"195" = disabled;
            #"196" = disabled;
            #"197" = disabled;
            #"198" = disabled;
            #"199" = disabled;
            #"200" = disabled;
            #"201" = disabled;
            #"202" = disabled;
            #"203" = disabled;
            #"204" = disabled;
            #"205" = disabled;
            #"206" = disabled;
            #"207" = disabled;
            #"208" = disabled;
            #"209" = disabled;
            #"210" = disabled;
            #"211" = disabled;
            #"212" = disabled;
            #"213" = disabled;
            #"214" = disabled;
            #"215" = disabled;
            #"216" = disabled;
            #"217" = disabled;
            #"218" = disabled;
            #"219" = disabled;
            #"220" = disabled;
            #"221" = disabled;
            #"222" = disabled;
            #"223" = disabled;
            #"224" = disabled;
            #"225" = disabled;
            #"226" = disabled;
            #"227" = disabled;
            #"228" = disabled;
            #"229" = disabled;
            #"230" = disabled;
            #"231" = disabled;
            #"232" = disabled;
            #"233" = disabled;
            #"234" = disabled;
            #"235" = disabled;
            #"236" = disabled;
            #"237" = disabled;
            #"238" = disabled;
            #"239" = disabled;
            #"240" = disabled;
            #"241" = disabled;
            #"242" = disabled;
            #"243" = disabled;
            #"244" = disabled;
            #"245" = disabled;
            #"246" = disabled;
            #"247" = disabled;
            #"248" = disabled;
            #"249" = disabled;
            #"250" = disabled;
            #"251" = disabled;
            #"252" = disabled;
            #"253" = disabled;
            #"254" = disabled;
            #"255" = disabled;
            #"256" = disabled;
            #"257" = disabled;
            #"258" = disabled;
            #"259" = disabled;
            #"260" = disabled;
            #"261" = disabled;
            #"262" = disabled;
            #"263" = disabled;
            #"264" = disabled;
            #"265" = disabled;
            #"266" = disabled;
            #"267" = disabled;
            #"268" = disabled;
            #"269" = disabled;
            #"270" = disabled;
            #"271" = disabled;
            #"272" = disabled;
            #"273" = disabled;
            #"274" = disabled;
            #"275" = disabled;
            #"276" = disabled;
            #"277" = disabled;
            #"278" = disabled;
            #"279" = disabled;
            #"280" = disabled;
            #"281" = disabled;
            #"282" = disabled;
            #"283" = disabled;
            #"284" = disabled;
            #"285" = disabled;
            #"286" = disabled;
            #"287" = disabled;
            #"288" = disabled;
            #"289" = disabled;
            #"290" = disabled;
            #"291" = disabled;
            #"292" = disabled;
            #"293" = disabled;
            #"294" = disabled;
            #"295" = disabled;
            #"296" = disabled;
            #"297" = disabled;
            #"298" = disabled;
            #"299" = disabled;
            #"300" = disabled;
        };
    };
  };
    };

  # Add ability to used TouchID for sudo authentication
  security.pam.enableSudoTouchIdAuth = true;

  # Create /etc/zshrc that loads the nix-darwin environment.
  # this is required if you want to use darwin's default shell - zsh
  programs.zsh.enable = true;

}
