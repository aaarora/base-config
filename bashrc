#Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#Personal
alias jupnb='jupyter notebook --no-browser --port=9000'
alias niceplot='php ~/util/niceplots/index.php > ./index.html'

#I'm Stupid
alias sl='ls'
alias sclear='clear'
alias clea='clear'
alias rls='ls'
alias vmi='vim'
alias vom='vim'
alias scd='cd'
alias kubetl='kubectl'
alias gept='kubectl get pods -o wide'

# Make CL Readable
export PS1='[$(date +%H%M)] \[\033[1;30m\]\u@\h\[\e[0m\] \W\$ '

# Kubernetes
export KUBECONFIG=~/.kube/config.river 
alias getp='kubectl get pods -o wide'

# CMSSW
source /cvmfs/cms.cern.ch/cmsset_default.sh
alias cmssw80='cwd=${PWD}; cd /cvmfs/cms.cern.ch/slc6_amd64_gcc530/cms/cmssw/CMSSW_8_0_25/; cmsenv; cd $cwd; echo Now using CMSSW v8.0.25'
alias cmssw94='cwd=${PWD}; cd /cvmfs/cms.cern.ch/slc6_amd64_gcc630/cms/cmssw/CMSSW_9_4_1/src; cmsenv; cd $cwd; echo Now using CMSSW v9.4.1'
alias cmssw1025='cwd=${PWD}; cd /cvmfs/cms.cern.ch/slc6_amd64_gcc700/cms/cmssw/CMSSW_10_2_5/src; cmsenv; cd $cwd; echo Now using CMSSW v10.2.05'
alias cmssw10211='cwd=${PWD}; cd /cvmfs/cms.cern.ch/slc6_amd64_gcc700/cms/cmssw/CMSSW_10_2_11/src; cmsenv; cd $cwd; echo Now using CMSSW v10.2.11'
alias cmssw10218='cwd=${PWD}; cd /cvmfs/cms.cern.ch/slc6_amd64_gcc700/cms/cmssw/CMSSW_10_2_18/src; cmsenv; cd $cwd; echo Now using CMSSW v10.2.18'
alias cmssw11107='cwd=${PWD}; cd /cvmfs/cms.cern.ch/slc7_amd64_gcc820/cms/cmssw/CMSSW_11_1_7/src; cmsenv; cd $cwd; echo Now using CMSSW v11.1.07'
alias cmssw11108='cwd=${PWD}; cd /cvmfs/cms.cern.ch/slc7_amd64_gcc820/cms/cmssw/CMSSW_11_1_8/src; cmsenv; cd $cwd; echo Now using CMSSW v11.1.08'

# ls aliases
alias l="ls -lh --color=auto"
alias ll="ls -lh --color=auto"
alias lk="ls -lthrGH"

#Fix spelling errors for cd
shopt -s cdspell

#Make history more useful
export PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
export HISTSIZE=30000
export HISTFILESIZE=30000
export HISTTIMEFORMAT='%F %T '
export HISTCONTROL=ignoredups

#Crab
export GLITE_VERSION="gLite-3.2.11-1"
export LCG_GFAL_INFOSYS=lcg-bdii.cern.ch:2170
export GLOBUS_TCP_PORT_RANGE=20000,25000

# git setup
if [ ! -f ~/.gitconfig ]; then
  git config --global user.name "aaarora"
  git config --global user.email "aaarora@ucsd.edu"
  git config --global alias.co checkout
  git config --global alias.ci 'commit -a -m'
  git config --global alias.pu 'push origin master'
  git config --global alias.up 'pull origin master'
  git config --global alias.fe 'fetch upstream'
  git config --global alias.re 'rebase upstream/master'
  git config --global alias.unstage 'reset HEAD'
fi

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

#Load Python preferences
export PYTHONSTARTUP=$HOME/.pythonrc

export EDITOR="vim"

#use files in .local directory for locally installed programs/libraries
export PATH=$HOME/.local/bin:$HOME/sw/python/bin:$PATH
export LD_LIBRARY_PATH=$HOME/.local/lib:$HOME/.local/lib64:$HOME/sw/python/lib:$LD_LIBRARY_PATH
export C_INCLUDE_PATH=$C_INCLUDE_PATH:$HOME/.local/include

export PKG_CONFIG_PATH=$HOME/.local/lib/pkgconfig:$HOME/sw/python/lib/pkgconfig

# Custom functions
function activate {
  source /home/users/aaarora/pyEnv/$1/bin/activate; 
  export PATH=/home/users/aaarora/pyEnv/$1/bin/:$PATH;
}
function mvpub {
  mv $1 /home/users/aaarora/public_html/$2;
  chmod -R 755 /home/users/aaarora/public_html/$2;
}
function chpub {
  chmod -R 755 $1
}
function execp {
  if [ -z "$2" ]; then
    kubectl exec -it $1 -- bash
  else
    kubectl exec -it $1 -n $2 -- bash
  fi
}
