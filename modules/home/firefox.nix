{ self, inputs, ... }:
{
  flake.homeModules.firefox =
    { pkgs, lib, ... }:
    {

      programs.firefox = {
        enable = true;
        languagePack = [
          "en-CA"
          "en-US"
        ];

        policies = {
          # Disable Featurs
          DisablePocket = true;
          DisableTelemtry = true;
          DisableRemoteImprovements = true;
          GenerativeAI.enabled = false;
          DisableFirefoxAccounts = true;

          FirefoxSuggest = {
            SponsoredSuggestions = false;
          };

          # Networking
          DNSOverHTTPS = {
            Enabled = true;
            ProviderURL = "https://base.dns.mullvad.net/dns-query";
          };
          HttpsOnlyMode = "enabled";
          EnableTrackingProtection = {
            Value = true;
            Locked = false;
            Cryptomining = true;
            Fingerprinting = true;
            EmailTracking = true;
            SuspectedFingerprinting = true;
            Category = "strict";
          };
        };
      };

      # Profile Config
      profiles.default = {

        bookmarks = ./firefox-bookmarks.nix;
        # Search Engines
        search = {
          force = true;
          default = "DuckDuckGo";
          privateDefault = "DuckDuckGo";

          engines = {
            "Nix Packages" = {
              urls = [
                {
                  template = "https://search.nixos.org/packages";
                  params = [
                    {
                      name = "channel";
                      value = "unstable";
                    }
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@np" ];
            };

            "Nix Options" = {
              urls = [
                {
                  template = "https://search.nixos.org/options";
                  params = [
                    {
                      name = "channel";
                      value = "unstable";
                    }
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@no" ];
            };

            "NixOS Wiki" = {
              urls = [
                {
                  template = "https://wiki.nixos.org/w/index.php";
                  params = [
                    {
                      name = "search";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@nw" ];
            };
          };
        };
      };
    };
}
