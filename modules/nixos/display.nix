{ ... } :
{
    # xserver settings
    services.xserver = {
        enable = true;
        videoDrivers = [ "nvidia" ];
        xkb.layout = "us";
    };

    # display manager (login screen)
    services.displayManager.ly = {
        enable = true;
        settings = {
            save = true;
            animation = "matrix";
        };
    };

}
