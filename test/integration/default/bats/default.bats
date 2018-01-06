#!/usr/bin/env bats

function setup {
  [ -f /etc/default/locale ] && . /etc/default/locale
  [ -f /etc/locale.conf ] && . /etc/locale.conf
  [ -f /etc/sysconfig/i18n ] && . /etc/sysconfig/i18n
  true;
}

@test "LANG should be en_US.utf8" {
    [ "$LANG" = "en_US.utf8" ]
}

@test "LC_ALL should be empty" {
    if [ -f /etc/locale.conf ] ; then
        skip "LC_ALL cannot be set globally on Fedora"
    fi
    [ "$LC_ALL" = "" ]
}
