###########################################################################
#
#   Filename:           .bashrc
#
#   Author:             smorton based on .bashrc for cygwin 1.3 by mbs
#
#   Created:            2010/06/03 17:45:10
#
#   Description:        Default .bashrc for new developers on PANOS using DESKTOP_2: Win7 + Cygwin 1.5
#
# Note - you should try not to modify this file if you can help it. You can
# put your personal settings in .bashrc.local which this file will 'source'
# automatically.
#
#
###########################################################################
#
#                 Source Control System Information
#
#   $Id: .bashrc,v 1.45 2013/11/01 19:28:49 smorton Exp $
#
###########################################################################
#
#                  Copyright (c) 2010-2010 Alcatel-Lucent
#
###########################################################################

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/X11R6/bin

if $(uname -a | grep -qi cygwin)
then
    export OSTYPE=cygwin
    cygwin=1
    export WIND_HOST_TYPE=x86-win32
    export DESKTOP_2=1
else
    export OSTYPE=linux
    cygwin=0
    export WIND_HOST_TYPE=x86-linux
fi

if [ -z $USER ] && [ ! -z $USERNAME ]
then
    export USER=$USERNAME
fi
if [ -z $USERNAME ] && [ ! -z $USER ]
then
    export USERNAME=$USER
fi


# This is not needed to build TiMOS. The build environment figures it out
# automatically. But, it is here just to catch incorrecty installed software
# installations to make it easier for me to debug an installation somebody
# has screwed up.
export WIND_BASE=/usr/local/tornado-2.0
export EMACS_BASE=/usr/local/emacs-20.6

export TMP=/tmp
export TEMP=/tmp

#
# CVS things
#
export CVSROOT=":pserver:$USER@cvspc.mv.usa.alcatel.com:/swdev/cvsrep"
export GASHROOT=":pserver:$USER@gashpc.mv.usa.alcatel.com:/swdev/cvsrep"
export ADMINROOT=":pserver:$USER@cvspc.mv.usa.alcatel.com:/swdev/adminrep"
export CVSREAD=TRUE

#
# Things for building PANOS
#
export MAKE_MODE=UNIX
# The default TiMOS build targets.
export TGT_HW=i386
export TGT_SYS=both

#
# Set up the path. It's done in stages...
#

if [ $cygwin -eq 1 -a -d /etc/alternatives ]
then
    export PATH=${PATH}:/etc/alternatives
fi

#
# Wind River Tornado
# 
if [ -d ${WIND_BASE}/host/${WIND_HOST_TYPE}/bin ]
then
    export PATH=${PATH}:${WIND_BASE}/host/${WIND_HOST_TYPE}/bin
fi

#
# Various tools that may or may not exist
#

# Emacs
if [ -d ${EMACS_BASE}/bin ]
then
    export PATH=${PATH}:${EMACS_BASE}/bin
fi

# VI-clone
if [ -d /usr/local/vim56 ]
then
    export PATH=${PATH}:/usr/local/vim56
fi

# TCL
if [ -d /usr/local/tcl/bin ]
then
    export PATH=${PATH}:/usr/local/tcl/bin
fi

# WinCVS, use its version of cvs over what is in /bin
# 4/14/05 mbs: Not any more. With newer wincvs versions, they
# have severely screwed things up. You can't script a login (which might
# be intentional). And, often 'cvs edit' leaves a file still read-only.
# Plus, it seems to have totally messed up execute permissions. It seems
# make all .c and .h files executable.
#if [ -d /usr/local/wincvs/CVSNT ]
#then
#    export PATH=/usr/local/wincvs/CVSNT:${PATH}
#fi


#
# Sun's java compiler. The thing gets installed in different
# places depending upon the particular versions. Something that revs
# once per month is sort of a problem... Try and "guess" at the most recent
# one. Surely the most recent is the "best", right?
#
jdk=$(/bin/ls -d -t /j2sdk* 2>/dev/null | head -1)
if [ "${jdk}" != "" ]
then
    export PATH="${PATH}:${jdk}/bin"
else
    jdk=$(/bin/ls -d -t /jdk* 2>/dev/null | head -1)
    if [ "${jdk}" != "" ]
    then
        export PATH="${PATH}:${jdk}/bin"
    fi
fi

#
# If you have timostools, then use it
#
if [ -d /usr/local/timostools ]
then
    export PATH="/usr/local/timostools:${PATH}"
else
    echo "You do not appear to have the SW development tools."
fi

#
# Put standard Windows system path next
#
if [ $cygwin -eq 1 ]
then
    export PATH="${PATH}:$(cygpath -a -u $SYSTEMROOT)/system32"
    export PATH="${PATH}:$(cygpath -a -u $SYSTEMROOT)"
    export PATH="${PATH}:$(cygpath -a -u $SYSTEMROOT)/system32/Wbem"
    export PATH="${PATH}:$(cygpath -a -u $SYSTEMROOT)/system32/WindowsPowerShell/v1.0"
fi

#
# If you have a bin in your home directory, we'll use it
#
if [ -d ${HOME}/bin ]
then
    export PATH="${PATH}:${HOME}/bin"
fi

#
# Finally, use current directory
#
export PATH="${PATH}:."

#
# Make sure the temp directories exist
#
if [ ! -d $TMP ]
then
    mkdir -p $TMP
fi
if [ -d /cygdrive/c -a ! -d /cygdrive/c/tmp ]
then
    mkdir -p /cygdrive/c/tmp
fi
if [ -d /cygdrive/d -a ! -d /cygdrive/d/tmp ]
then
    mkdir -p /cygdrive/d/tmp
fi

#
# Set prompt to <working directory>, space, ">", space
#
export PS1="\w > "

# Set size of history
export HISTSIZE=500
export HISTFILESIZE=500

# Ignore duplicate cmds in history log; ignore cmds beginning with whitespace
export HISTCONTROL=ignoreboth

# When doing file completion, ignore files ending in these
export FIGNORE=".o:~"

# Ignore EOF character
export IGNOREEOF

# Executed just before printing every prompt. You probably don't
# want to do anything with this.
#export PROMPT_COMMAND="printf '\e]0;$HOSTNAME\7'"

# Don't allow redirection to overwrite existing file
export noclobber

# If you do 'cd <val>' and val isn't a directory, then assume
# it's a variable and cd to the contents of the variable.
export cdable_vars

#
# Generic aliases.
# You may want to add more or override (unalias) these in your .bashrc.local
# These aliases put training wheels on commands like rm and mv to prevent
# overwriting existing files
#
alias copy='cp -i'
alias del='rm -i'
alias dir='ls -lF'
alias h=history
alias la='ls -a'
alias ll='ls -l'
alias ls='ls -F'
alias more=less
alias mv='mv -i'
alias ren='mv -i'
alias rm='rm -i'

#
# Some aliases specific to our development
#
alias panos='cd $HOME/ws/panos'

#
# Do a 'cvs -n up' which shows all files in the currrent directory
# and below which need to be updated or are modified. But, filter out
# all of the noise lines that cvs generates as it traverses a file tree
#
alias cvsnup='cvs -n -q up -P -d 2>/dev/null | grep -v "^\?"'
alias cvsup='cvs -z9 -q up -P -d 2>/dev/null | grep -v "^\?"'
alias cvsedit='cvs edit'
alias cvschanged="cvs -n -f -q up -dPR 2>/dev/null | grep '^[MARC?] '"
alias cvschanged2='cvs -z9 -q status 2>&1 | grep Status | egrep -v "(Up-to|Needs Patch)"'
alias cvsstatus='cvs status | grep Status'


# Turn on vi-style command line editing.
# If you prefer EMACS-style editing, use -o emacs
# If you prefer windows-style editing (using arrow keys), don't use anything.
#set -o vi

#make an intelligent guess as to what your DISPLAY env var should be
if [ -z ${DISPLAY:=""} ]; then
    XSERVER=$(who am i | /bin/awk '{print $6}' | /bin/sed 's/[()]//g')
    XSERVER=${XSERVER%%:*}
    if [[ -z ${XSERVER}  || ${XSERVER} == $(hostname) || ${XSERVER} == "unix" ]]; then 
      export DISPLAY=$(hostname):0.0		# Display on local host
    else		
      export DISPLAY=${XSERVER}:0.0	# Display on remote host
    fi
fi

#
# Finally, if a ~/.bashrc.local exists, source it
#
if [ -e ~/.bashrc.local ]
then
    source ~/.bashrc.local
fi

