
# EC Standard Login Environment -*- sh -*-
# user bashrc
# $Source: /nfs/vdce_ct/src/pkgs/eclogin/cvs/ec_environ-1.0/release/user/bashrc,v $
# $Revision: 1.8 $

# This table illustrates differences among platforms
# for execution of .bashrc and/or .profile.
#
# L = login shell            P = ~/.profile
# N = non-login shell        B = ~/.bashrc
#                            X = neither
#
#                  redhat     hpux     solaris    suse     debian
# /bin/bash     L   P         n/a      n/a        B,P      B*
#               N   X         n/a      n/a        B        B
#
# /usr/intel/   L   P         P        P          B,P      B*
#    bin/bash   N   B         B        B          B        B
#
# /bin/ksh      L   P         P        P          P        P
#               N   X         X        X          X        X
#
# /usr/intel/   L   X         X        X          X        X
#    bin/zsh    N   X         X        X          X        X
#
# /bin/sh       L   P         P        P          B,P      P
#               N   X         X        X          X        X
#
# * To maintain compatibility with other platforms, debian
#   should invoke .profile for login shells.  Since debian
#   does run /etc/profile for login shells, we have set
#   the trigger there.

#use unique shell var since profile could corrupt name before our exiting log entry


### 
###-------->Shell-specific features<--------
### 

if [ "1$BASH" != "1" ]; then
   ###
   ### features specific to bash (this normally would go in .bashrc)
   ###

   # section must have at least one comand
   /bin/true
fi

if [ "1$KSH_VERSION" != "1" ]; then
   ###
   ### features specific to korn shell (ksh)
   ###

   # section must have at least one comand
   /bin/true
fi

### 
###-------->LOGIN SHELLS<--------
###
if [ "1$PS1" != "1" ]; then
    ###
    ### This section runs for interactive shells only.
    ###

    ### example: you may wish to force the terminal
    # settings e.g. backspace.
    #
    stty erase '^H' # normal
    stty erase '^?' # Sun keyboard

    #PS1="`uname -n`$ "	#shell prompt

    # section must have at least one comand
    /bin/true

fi


ec_bashrc_error_log=/tmp/eclogin-errors.$USER
echo "I: (.bashrc) [entering] `/bin/date`" >> $ec_bashrc_error_log

if [ "1$EC_DEBIAN_LOGIN" != "1" ]; then
  if [ -r $HOME/.profile ]; then
    . $HOME/.profile
  fi
fi

# EC does NOT recommend using the .bashrc file;
# most shells are login shells and your custom
# changes should go in .profile.<username>.

# If you have bash-specific customizations for non-login
# shells, locate them in .bashrc.$USER

if [ -r "$HOME/.bashrc.$USER" ]; then
  . $HOME/.bashrc.$USER
fi

# See full documentation at /usr/intel/common/pkgs/eclogin/<version>/docs
# or http://goto.intel.com/eclogin

echo "I: (.bashrc) [leaving] `/bin/date`" >> $ec_bashrc_error_log
unset ec_bashrc_error_log










