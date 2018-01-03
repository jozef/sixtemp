/* VERSION 0.01; 29.12.2017; see below for description and documentation */
#ifndef TextCMD_h
#define TextCMD_h

#include <Arduino.h>

const uint8_t TextCMD_max_argv = 10;

struct cmd_dispatch {
    char* cmd;
    void (*cb)(uint8_t argc, char* argv[]);
};

class TextCMD {
    public:
        TextCMD(uint8_t count, cmd_dispatch dispatch[]);
        uint8_t argc = 0;
        char* argv[TextCMD_max_argv];
        void split_line_to_argv(char* line);
        void set_argv(uint8_t new_argc, char* new_argv[]);
        void do_dispatch();
        void do_dispatch(char* line);
        // int argv_to_int(uint8_t idx);    # TODO parse argv[idx-1] and return integer of that argument
    private:
        uint8_t _dispatch_count = 0;
        cmd_dispatch* _dispatch;
};

#endif

/*

=head1 NAME

    TextCMD.h - Library for decode text commands

=head1 SYNOPSIS

    cmd_dispatch commands[] = {
        {
            "?",
            &cmd_help
        },
        {
            "tled",
            &cmd_tled
        }
    };

    TextCMD cmd((sizeof(commands)/sizeof(commands[0])),commands);
    cmd.do_dispatch("?");
    cmd.do_dispatch("tled 5");

    void cmd_help(uint8_t argc, String argv[]) {
        Serial.println("supported commands:");
        Serial.println("    tled [num]      - do led blink test num times (1 is default)");
        Serial.println("    help/?          - print this help");
    }
    void cmd_tled(uint8_t argc, String argv[]) {
        uint8_t loops = 1;
        if (argc > 1) {
            loops = argv[1].toInt();
        }
        for (uint8_t i=1; i <= loops; i++) {
            do_test_led();
        }
    }

=head1 DESCRIPTION

Helps to read text lines and decode them into arguments and call corresponsing
function.

NOTE to save on memory, split_line_to_argv(char* line) and do_dispatch(char* line)
will modify the original line, by switching spaces to \0. argv pointer array will
be set to those line chunks

=head1 LICENSE

This is free software, licensed under the MIT License.

=head1 AUTHOR

    Jozef Kutej

=cut

*/
