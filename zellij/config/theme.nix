{ pkgs, ... }:

{
    programs.zellij.settings = {
        theme = "gruvbox-material";
        themes.gruvbox-material = {
            text_unselected = {
                base = [ 212 190 152 ];
                background = [ 29 32 33 ];
                emphasis_0 = [ 216 166 87 ];
                emphasis_1 = [ 169 182 101 ];
                emphasis_2 = [ 125 174 163 ];
                emphasis_3 = [ 211 134 155 ];
            };
            text_selected = {
                base = [ 212 190 152 ];
                background = [ 60 56 54 ];
                emphasis_0 = [ 234 105 98 ];
                emphasis_1 = [ 169 182 101 ];
                emphasis_2 = [ 125 174 163 ];
                emphasis_3 = [ 211 134 155 ];
            };
            ribbon_selected = {
                base = [ 29 32 33 ];
                background = [ 169 182 101 ];
                emphasis_0 = [ 234 105 98 ];
                emphasis_1 = [ 216 166 87 ];
                emphasis_2 = [ 211 134 155 ];
                emphasis_3 = [ 125 174 163 ];
            };
            ribbon_unselected = {
                base = [ 212 190 152 ];
                background = [ 40 40 40 ];
                emphasis_0 = [ 234 105 98 ];
                emphasis_1 = [ 212 190 152 ];
                emphasis_2 = [ 125 174 163 ];
                emphasis_3 = [ 211 134 155 ];
            };
            frame_selected = {
                base = [ 169 182 101 ];
                background = [ 0 0 0 ];
                emphasis_0 = [ 234 105 98 ];
                emphasis_1 = [ 216 166 87 ];
                emphasis_2 = [ 211 134 155 ];
                emphasis_3 = [ 0 0 0 ];
            };
            exit_code_success = {
                base = [ 169 182 101 ];
                background = [ 0 0 0 ];
                emphasis_0 = [ 125 174 163 ];
                emphasis_1 = [ 29 32 33 ];
                emphasis_2 = [ 211 134 155 ];
                emphasis_3 = [ 125 174 163 ];
            };
            exit_code_error = {
                base = [ 234 105 98 ];
                background = [ 0 0 0 ];
                emphasis_0 = [ 216 166 87 ];
                emphasis_1 = [ 0 0 0 ];
                emphasis_2 = [ 0 0 0 ];
                emphasis_3 = [ 0 0 0 ];
            };
        };
    };
}
