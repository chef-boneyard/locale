Description
===========

Sets the default system locale for this system.  You can see which locales 
are available by running `locale -a`.

On Debian based systems, this recipe sets the locale by running `update-locale`
and on Fedora, it uses `localectl`.

On RHEL based systems, the recipe operates on the /etc/sysconfig/i18n file
directly because there is no standard command line tool to change the system
locale settings.

Platforms
=========

Tested on Ubuntu, CentOS, Fedora

Attributes
==========

* `node[:locale][:lang]` -- the value for "LANG": defaults to "en_US.utf8"
* `node[:locale][:lc_all]` -- the value for "LC_ALL": defaults to "en_US.utf8"

Note that you cannot set "LC_ALL" on Fedora.  It is a documented limitation; 
see "man 5 locale.conf".  So this recipe simply ignores LC_ALL for Fedora.

Usage
=====

Include the default recipe in your run list.
