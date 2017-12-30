/* VERSION 0.01; 29.12.2017; see below for description and documentation */
#ifndef TextCMD_h
#define TextCMD_h

#include <Arduino.h>

const uint8_t TextCMD_max_argv = 10;

struct cmd_dispatch {
    String cmd;
    void (*cb)(uint8_t argc, String argv[]);
};

class TextCMD {
    public:
        TextCMD(uint8_t count, cmd_dispatch dispatch[]);
        uint8_t argc = 0;
        String argv[TextCMD_max_argv];
        void parse_line(const String &line);
        void set_argv(uint8_t new_argc, String new_argv[]);
        void do_dispatch();
        void do_dispatch(const String &line);
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

=head1 LICENSE

This is free software, licensed under the MIT License.

=head1 AUTHOR

    Jozef Kutej

=cut

*/
