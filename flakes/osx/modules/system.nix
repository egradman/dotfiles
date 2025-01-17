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
        AppleSymbolicHotKeys = {
          # Move left a space
          "79" = {
            enabled = false;
            value = {
              parameters = [
                65535
                123
                8650752
              ];
              type = "standard";
            };
          };
          # Move right a space
          "81" = {
            enabled = false;
            value = {
              parameters = [
                65535
                124
                8650752
              ];
              type = "standard";
            };
          };
          # Open spotlight
          "64" = {
            enabled = true;
            value = {
              parameters = [
                32
                49
                1048576
              ];
              type = "standard";
            };
          };

  # Others that we want disabled
  "0" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "1" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "2" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "3" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "4" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "5" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "6" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "7" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "8" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "9" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "10" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "11" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "12" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "13" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "14" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "15" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "16" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "17" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "18" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "19" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "20" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "21" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "22" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "23" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "24" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "25" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "26" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "27" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "28" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "29" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "30" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "31" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "32" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "33" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "34" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "35" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "36" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "37" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "38" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "39" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "40" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "41" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "42" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "43" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "44" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "45" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "46" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "47" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "48" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "49" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "50" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "51" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "52" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "53" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "54" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "55" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "56" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "57" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "58" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "59" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "60" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "61" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "62" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "63" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "65" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "66" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "67" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "68" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "69" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "70" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "71" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "72" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "73" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "74" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "75" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "76" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "77" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "78" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "80" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "82" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "83" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "84" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "85" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "86" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "87" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "88" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "89" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "90" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "91" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "92" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "93" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "94" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "95" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "96" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "97" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "98" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "99" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "100" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "101" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "102" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "103" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "104" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "105" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "106" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "107" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "108" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "109" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "110" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "111" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "112" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "113" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "114" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "115" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "116" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "117" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "118" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "119" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "120" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "121" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "122" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "123" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "124" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "125" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "126" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "127" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "128" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "129" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "130" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "131" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "132" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "133" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "134" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "135" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "136" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "137" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "138" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "139" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "140" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "141" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "142" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "143" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "144" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "145" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "146" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "147" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "148" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "149" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "150" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "151" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "152" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "153" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "154" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "155" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "156" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "157" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "158" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "159" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "160" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "161" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "162" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "163" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "164" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "165" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "166" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "167" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "168" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "169" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "170" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "171" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "172" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "173" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "174" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "175" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "176" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "177" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "178" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "179" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "180" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "181" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "182" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "183" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "184" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "185" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "186" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "187" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "188" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "189" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "190" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "191" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "192" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "193" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "194" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "195" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "196" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "197" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "198" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "199" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "200" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "201" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "202" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "203" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "204" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "205" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "206" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "207" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "208" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "209" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "210" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "211" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "212" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "213" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "214" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "215" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "216" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "217" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "218" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "219" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "220" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "221" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "222" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "223" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "224" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "225" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "226" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "227" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "228" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "229" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "230" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "231" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "232" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "233" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "234" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "235" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "236" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "237" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "238" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "239" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "240" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "241" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "242" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "243" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "244" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "245" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "246" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "247" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "248" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "249" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "250" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "251" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "252" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "253" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "254" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "255" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "256" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "257" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "258" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "259" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "260" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "261" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "262" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "263" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "264" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "265" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "266" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "267" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "268" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "269" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "270" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "271" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "272" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "273" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "274" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "275" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "276" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "277" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "278" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "279" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "280" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "281" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "282" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "283" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "284" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "285" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "286" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "287" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "288" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "289" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "290" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "291" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "292" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "293" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "294" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "295" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "296" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "297" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "298" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "299" = { enabled = false; value = { parameters = []; type = "standard"; }; };
  "300" = { enabled = false; value = { parameters = []; type = "standard"; }; };
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
