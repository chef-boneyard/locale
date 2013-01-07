Description
===========

Sets default system locale

You can see which languages are available by 
$ locale -a 

On debian based systems you can set the locale by running
 update-locale LANG={lang} LANGUAGE={lang}
e.g.
 update-locale LANG=en_AU.utf8 LANGUAGE=en_AU.utf8

It updates the file /etc/default/locale

LANG variable sets the locale and LANGUAGE variable sets the fallback
language in case a program does not have translations available for
the default locale. It is also used by the gettext program.

For docs see:  
* https://help.ubuntu.com/community/Locale/
* https://help.ubuntu.com/community/EnvironmentVariables
* http://www.gnu.org/savannah-checkouts/gnu/gettext/manual/html_node/The-LANGUAGE-variable.html#The-LANGUAGE-variable
* http://serverfault.com/questions/455718/for-setting-locale-in-ubuntu-what-does-the-language-environment-variable-mean
* http://serverfault.com/questions/455922/in-ubuntu-what-is-the-difference-between-en-usutf8-and-en-us-when-setting-lan

On rhel based systems you can set default locale updating /etc/sysconfig/i18n
There doesn't seem to be a command line tool to update this file?!?

Requirements
============

Tested on Ubuntu, CentOS

Attributes
==========

* `node[:locale][:lang]` -- defaults to "en_US.utf8"
* `node[:locale][:language]` -- defaults to "en_US:"
* `node[:locale][:lc_all]` -- defaults to "en_US.utf8"

Usage
=====

Include the default recipe in your run list.
