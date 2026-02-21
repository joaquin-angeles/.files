{ ... }:

{
    # Fail2Ban
    services.fail2ban = {
        enable = true;
        maxretry = 3;
        ignoreIP = [
            "10.0.0.0/8"
            "172.16.0.0/12"
            "192.168.0.0/16"
        ];
        bantime = "30m";
        bantime-increment = {
            enable = true;
            multipliers = "1 2 4 8 16 32 64";
            maxtime = "24h";
            overalljails = true;
        };
    };
}
