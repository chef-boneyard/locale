#!/usr/bin/env bats

@test "LANG should be en_US.utf8" {
    [ -f /etc/sysconfig/i18n ] && . /etc/sysconfig/i18n # centos needs a reboot
    [ "$LANG" = "en_US.utf8" ]
}

@test "LC_ALL should be C" {
    [ -f /etc/sysconfig/i18n ] && . /etc/sysconfig/i18n # centos needs a reboot
    [ "$LC_ALL" = "C" ]
}
