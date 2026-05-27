{ self, inputs, ... }:
{
  flake.homeModules.firefox =
    { pkgs, lib, ... }:
    {
      programs.firefox = {
        enable = true;
        languagePacks = [
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

          # Behavior/UI
          Homepage = "previous-session";
          OfferToSaveLogins = false;
          FirefoxHome = {
            SponsoredTopSites = false;
            Highlights = false;
            Pocket = false;
            Stories = false;
            SponsoredPocket = false;
            SponsoredStories = false;
            Snippets = false;
          };

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
          # ---- EXTENSIONS ----
          # Check about:support for extension/add-on ID strings.
          # Valid strings for installation_mode are "allowed", "blocked",
          # "force_installed" and "normal_installed".
          ExtensionSettings = {
            # "*".installation_mode = "blocked"; # blocks all addons except the ones specified below
            # uBlock Origin:
            "uBlock0@raymondhill.net" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
              installation_mode = "force_installed";
            };
            # Privacy Badger:
            "jid1-MnnxcxisBPnSXQ@jetpack" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
              installation_mode = "force_installed";
            };
            # 1Password:
            "{d634138d-c276-4fc8-924b-40a0ea21d284}" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/1password-x-password-manager/latest.xpi";
              installation_mode = "force_installed";
            };
            # DuckDuckGo
            "jid1-ZAdIEUB7XOzOJw@jetpack" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/jid1-ZAdIEUB7XOzOJw@jetpack/latest.xpi";
              installation_mode = "force_installed";
            };
          };
        };

        # Profile Config
        profiles.default = {

          bookmarks = {
            force = true;
            settings = [
              {
                name = "kernel.org";
                url = "https://www.kernel.org";
              }
              {
                name = "nix/niri";
                bookmarks = [
                  {
                    name = "dotfriedrice/.config/niri/config.kdl at master · nickjj/dotfriedrice";
                    url = "https://github.com/nickjj/dotfriedrice/blob/master/.config/niri/config.kdl";
                  }
                  {
                    name = "nixconf/wrappedPrograms/niri.nix at main · vimjoyer/nixconf";
                    url = "https://github.com/vimjoyer/nixconf/blob/main/wrappedPrograms/niri.nix";
                  }
                ];
              }
              {
                name = "UBC";
                bookmarks = [
                  {
                    name = "Home - Workday";
                    url = "https://wd10.myworkday.com/ubc/d/home.htmld";
                  }
                  {
                    name = "Scope - coop";
                    url = "https://scope.sciencecoop.ubc.ca/";
                  }
                ];
              }
              {
                name = "Excel";
                bookmarks = [
                  {
                    name = "Athlete Resources - Exceleration Triathlon and Multisport";
                    url = "https://excelerationtriclub.ca/youth-junior-u23-resource-page/";
                  }
                  {
                    name = "Airtable - Run_Paces";
                    url = "https://airtable.com/appbItJyrDbCbkKOb/shrJsnrz1LMLqxbV4/tblnb69JKZ7zUQX3z";
                  }
                  {
                    name = "Airtable - Swim_Paces";
                    url = "https://airtable.com/appbItJyrDbCbkKOb/shr1pSH7tztolaF3k/tblnb69JKZ7zUQX3z";
                  }
                  {
                    name = "TrainingPeaks - Plan your training, track your workouts and measure your progress";
                    url = "https://app.trainingpeaks.com/#calendar";
                  }
                  {
                    name = "Google Calender";
                    url = "https://calendar.google.com/calendar/u/0/r";
                  }
                ];
              }
              {
                name = "Personal";
                bookmarks = [
                  {
                    name = "MTG";
                    bookmarks = [
                      {
                        name = "Scryfall";
                        url = "https://scryfall.com/";
                      }
                    ];
                  }
                  {
                    name = "RPGs";
                    bookmarks = [
                      {
                        name = "Dicecloud";
                        url = "https://dicecloud.com/";
                      }
                    ];
                  }
                ];
              }
              {
                name = "Coding";
                bookmarks = [
                  {
                    name = "Interpreter";
                    bookmarks = [
                      {
                        name = "Lox Tutorial";
                        url = "https://craftinginterpreters.com/contents.html";
                      }
                      {
                        name = "Inter github";
                        url = "https://github.com/Xilef1110/Interpreter";
                      }
                    ];
                  }
                ];
              }
              {
                name = "Bookmarks Toolbar";
                toolbar = true;
                bookmarks = [
                  {
                    name = "Play board games online! • Board Game Arena";
                    url = "https://boardgamearena.com/";
                  }
                  {
                    name = "NixOS Search - Packages";
                    url = "https://search.nixos.org/packages";
                  }
                ];
              }
            ];
          };
          # Search Engines
          search = {
            force = true;
            default = "ddg";
            privateDefault = "ddg";

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
    };
}
