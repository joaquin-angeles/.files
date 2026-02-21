{ ... }:

{
    networking = {
        nftables.enable = true;
        nftables.ruleset = ''
            table inet filter {
                chain input {
                    type filter hook input priority 0; policy drop;
                    iifname lo accept
                    ct state {established, related} accept
                    ip saddr {10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16} tcp dport 22 accept
                    ip protocol icmp limit rate 5/second accept
                    ip6 nexthdr icmpv6 limit rate 5/second accept
                }
                chain output { type filter hook output priority 0; policy accept; }
                chain forward { type filter hook forward priority 0; policy drop; }
            }
        '';
        nftables.checkRuleset = false;
    };
}
