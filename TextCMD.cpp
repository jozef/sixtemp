/* see TextCMD.h */

#include "TextCMD.h"
#include <Arduino.h>

TextCMD::TextCMD(uint8_t count, cmd_dispatch dispatch[]) {
    _dispatch = dispatch;
    _dispatch_count = count;
}

int8_t TextCMD::do_dispatch(char* line) {
    split_line_to_argv(line);
    return do_dispatch();
}

int8_t TextCMD::do_dispatch() {
    if (!argc) {
        return 0;
    }
    for (uint8_t i = 0; i < _dispatch_count; i++) {
        if (strcmp(_dispatch[i].cmd, argv[0]) == 0) {
            return _dispatch[i].cb(argc,argv);
        }
    }
    return -1;
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
    uint8_t args_start = 0;

    // cmds with spaces inside as argv[0]
    for (uint8_t i = 0; i < _dispatch_count; i++) {
        uint8_t cmd_len = strlen(_dispatch[i].cmd);
        if (
            (strncmp(line,_dispatch[i].cmd,cmd_len) == 0)
            && ((line[cmd_len] == ' ') || (line[cmd_len] == '\0'))
        ) {
            line[cmd_len] = '\0';
            argv[0] = &line[0];
            argc = 1;
            args_start = cmd_len + 1;
            break;
        }
    }

    for (int i = args_start; i < line_len; i++) {
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

