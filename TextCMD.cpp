/* see TextCMD.h */

#include "TextCMD.h"
#include <Arduino.h>

TextCMD::TextCMD(uint8_t count, cmd_dispatch dispatch[]) {
    _dispatch = dispatch;
    _dispatch_count = count;
}

void TextCMD::do_dispatch(String line) {
    parse_line(line);
    do_dispatch();
}

void TextCMD::do_dispatch() {
    if (!argc) {
        return;
    }
    for (uint8_t i = 0; i < _dispatch_count; i++) {
        if (_dispatch[i].cmd == argv[0]) {
            _dispatch[i].cb(argc,&argv[0]);
            break;
        }
    }
}

void TextCMD::parse_line(String line) {
    argc = 0;
    argv[0] = "";

    bool new_arg = true;
    int start_ch = 0;
    for (int i = 0; i<line.length(); i++) {
        char ch = line[i];
        if (ch == ' ') {
            if (new_arg) {
                continue;
            }

            argc++;
            new_arg = true;
            if (argc == TextCMD_max_argv) {
                break;
            }
            argv[argc] = "";
            continue;
        }
        new_arg = false;
        argv[argc] += ch;
    }
    if (!new_arg) {
        argc++;
    }
}

