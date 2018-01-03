/* see TextCMD.h */

#include "TextCMD.h"
#include <Arduino.h>

TextCMD::TextCMD(uint8_t count, cmd_dispatch dispatch[]) {
    _dispatch = dispatch;
    _dispatch_count = count;
}

void TextCMD::do_dispatch(char* line) {
    split_line_to_argv(line);
    do_dispatch();
}

void TextCMD::do_dispatch() {
    if (!argc) {
        return;
    }
    for (uint8_t i = 0; i < _dispatch_count; i++) {
        if (strcmp(_dispatch[i].cmd, argv[0]) == 0) {
            _dispatch[i].cb(argc,argv);
            break;
        }
    }
}

void TextCMD::set_argv(uint8_t new_argc, char* new_argv[]) {
    argc = new_argc;
    for (uint8_t i = 0; i < argc; i++) {
        argv[i] = new_argv[i];
    }
}

void TextCMD::split_line_to_argv(char* line) {
    argc = 0;
    bool new_arg = true;
    int line_len = strlen(line);
    for (int i = 0; i< line_len; i++) {
        if (line[i] == ' ') {
            new_arg = true;
            line[i] = '\0';
            continue;
        }
        if (new_arg) {
            if (argc+1 == TextCMD_max_argv) {
                break;
            }
            argv[argc] = &line[i];
            argc++;
            new_arg = false;
        }
    }
}

