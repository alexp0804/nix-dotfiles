{ pkgs, ... }:
{
    system = {
        defaults = {
            finder = {
                AppleShowAllFiles = true;
                FXDefaultSearchScope = "SCcf"; # when seaching, use current folder
                FXEnableExtensionChangeWarning = false;
                FXPreferredViewStyle = "Nlsv"; # default view is List View
                NewWindowTarget = "Home";
                ShowPathbar = true;
                _FXSortFoldersFirst = true;
            };
        };
    };
}
