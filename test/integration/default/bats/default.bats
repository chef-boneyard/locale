#!/usr/bin/env bats

@test "LANG should be en_US.utf8" {
    [ -f /etc/locale.conf ] && . /etc/locale.conf # fedora needs a reboot
    [ -f /etc/sysconfig/i18n ] && . /etc/sysconfig/i18n # centos needs a reboot
    [ "$LANG" = "en_US.utf8" ]
}

@test "LC_ALL should be C" {
    if [ -f /etc/locale.conf ] ; then
        skip "LC_ALL cannot be set globally on Fedora"
    fi
    [ -f /etc/sysconfig/i18n ] && . /etc/sysconfig/i18n # centos needs a reboot
    [ "$LC_ALL" = "C" ]
}
