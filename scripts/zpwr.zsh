#!/usr/bin/env bash
#{{{                    MARK:Header
#**************************************************************
##### Author: MenkeTechnologies
##### GitHub: https://github.com/MenkeTechnologies
##### Date: Wed Sep 18 15:53:09 EDT 2019
##### Purpose: bash script to run zpwr subcommands
##### Notes: escape $ in comments for perl subs
#}}}***********************************************************

if [[ -z $ZPWR_VERBS ]]; then
    declare -Ag ZPWR_VERBS
fi

ZPWR_VERBS[about]='about=show \$ZPWR_REPO_NAME banner'
ZPWR_VERBS[allsearch]='fzfAllKeybind=search all keybindings'
ZPWR_VERBS[altprettyprint]='alternatingPrettyPrint=pretty with alternating color'
ZPWR_VERBS[attach]='tmux attach-session=attach to tmux session'
ZPWR_VERBS[autoload]='zal=cd to autoload directory'
ZPWR_VERBS[autoloadcount]='zpwrAutoloadCount=total number of autoloads in \$ZPWR'
ZPWR_VERBS[autoloadlist]='zpwrAutoloadList=total list of autoloads in \$ZPWR'
ZPWR_VERBS[background]='b=run arg in background'
ZPWR_VERBS[backup]='backup=backup files'
ZPWR_VERBS[backuphistory]='zpwrBackupHistfile=backup \$HISTFILE'
ZPWR_VERBS[banner]='about=show \$ZPWR_REPO_NAME banner'
ZPWR_VERBS[brc]='brc=shell aliases file vim session'
ZPWR_VERBS[cat]='c=zpwr cat args'
ZPWR_VERBS[catcd]='cca=cat and cd to first dir'
ZPWR_VERBS[catviminfo]='catNvimOrVimInfo=cat custom vim info file'
ZPWR_VERBS[catrecentfviminfo]='recentfThenNvim=cat recentf then custom vim info file'
ZPWR_VERBS[catnviminforecentf]='nvimThenRecentf=cat custom vim info file then recentf'
ZPWR_VERBS[cd]='f=cd to directory arg'
ZPWR_VERBS[cdup]='r=cd up tree to directory arg'
ZPWR_VERBS[cfasd]='fasdFListVerb=c the fasd frecency ranked file'
ZPWR_VERBS[clean]='zpwrClean=clear all $ZPWR_DIRS_CLEAN'
ZPWR_VERBS[cleanall]='zpwrCleanAll=clear all $ZPWR_DIRS_CLEAN, temp and cache'
ZPWR_VERBS[cleancache]='cleanCache=clean all zpwr cache files'
ZPWR_VERBS[cleancompcache]='cleanCompCache=clean all zpwr compsys cache files'
ZPWR_VERBS[cleantemp]='cleanTemp=clean all zpwr temp files'
ZPWR_VERBS[clearls]='clearList=clear and list the files with no args'
ZPWR_VERBS[clearlist]='clearList=clear and list the files with no args'
ZPWR_VERBS[clone]='gcl=clone and cd to arg'
ZPWR_VERBS[cloneToForked]='cloneToForked=clone \$ZPWR_REPO_NAME to \$FORKED_DIR'
ZPWR_VERBS[colorsdiff]='gsdc=colorized side diff'
ZPWR_VERBS[color2]='color2=turn on stderr filter'
ZPWR_VERBS[compile]='recompile=recompile all cache comps'
ZPWR_VERBS[comps]='zco=cd to completion directory'
ZPWR_VERBS[completions]='zco=cd to completion directory'
ZPWR_VERBS[copycommand]='getCopyCommand=get the command to copy with system'
ZPWR_VERBS[decompile]='uncompile=delete all cache comps'
ZPWR_VERBS[detach]='detachall=detach from all tmux sessions'
ZPWR_VERBS[digs]='digs=run series on networking commands on arg'
ZPWR_VERBS[dirsearch]='fzfDirsearchVerb=cd to a sub dir'
ZPWR_VERBS[exists]='exists=check if command is valid'
ZPWR_VERBS[emacstokens]='etok=emacs the .tokens.sh file'
ZPWR_VERBS[emacsconfig]='econf=emacs all zpwr configs'
ZPWR_VERBS[emacsall]='emacsAll=emacs all zpwr files for :argdo'
ZPWR_VERBS[emacsallserver]='emacsAllServer=emacs all zpwr files for :argdo'
ZPWR_VERBS[emacsalledit]='emacsAllEdit=emacs edit 1 or more configs'
ZPWR_VERBS[emacsautoload]='emacsAutoload=emacs all autoloads :argdo'
ZPWR_VERBS[emacscd]='ce=emacs edit and cd to first dir'
ZPWR_VERBS[emacsplugincount]='zpwrEmacsPluginCount=total number of emacs plugins in \$ZPWR'
ZPWR_VERBS[emacspluginlist]='zpwrEmacsPluginList=total list of emacs plugins in \$ZPWR'
ZPWR_VERBS[emacsrecent]='emacsRecent=emacs edit most recent vim files'
ZPWR_VERBS[emacsrecentsudo]='sudoEmacsRecent=emacs edit most vim recent files'
ZPWR_VERBS[emacszpwr]='emacsZpwr=emacs zpwr dir'
ZPWR_VERBS[emacsemacsconfig]='emacsEmacsConfig=emacs edit emacs zpwr configs'
ZPWR_VERBS[emacsscripts]='emacsScripts=emacs all zpwr scripts for :argdo'
ZPWR_VERBS[emacsscriptedit]='emacsScriptEdit=emacs edit 1 or more scripts'
ZPWR_VERBS[emacsctags]='emacsZpwrCtags=emacs zpwr ctags tags'
ZPWR_VERBS[emacsgtags]='emacsZpwrGtags=emacs zpwr GNU global tags'
ZPWR_VERBS[emacsgtagsedit]='emacsZpwrGtagsEdit=emacs edit zpwr GNU global tags'
ZPWR_VERBS[emacsfindsearch]='findFzfNoZLEEmacs=emacs find drive for file'
ZPWR_VERBS[emacsfindsearchedit]='findFzfEditNoZLEEmacs=emacs edit find drive for file'
ZPWR_VERBS[emacslocatesearch]='locateFzfNoZLEEmacs=emacs accept locate drive for file'
ZPWR_VERBS[emacslocatesearchedit]='locateFzfEditNoZLEEmacs=emacs edit locate drive for file'
ZPWR_VERBS[emacswordsearch]='emacsFzfWordsearchVerb=emacs a file in a sub dir by word'
ZPWR_VERBS[emacswordsearchedit]='emacsFzfWordsearchVerbEdit=edit emacs a file in a sub dir by word'
ZPWR_VERBS[emacsfilesearch]='emacsFzfFilesearchVerb=emacs a file in a sub dir'
ZPWR_VERBS[emacsfilesearchedit]='emacsFzfFilesearchVerbEdit=edit emacs a file in a sub dir'
ZPWR_VERBS[envaccept]='fzfEnvVerbAccept=accept from fzf env'
ZPWR_VERBS[envedit]='fzfEnvVerbEdit=edit from fzf env'
ZPWR_VERBS[envvars]='zpwrEnvVars=list all ZPWR env vars'
ZPWR_VERBS[environmentvars]='zpwrEnvVars=list all ZPWR env vars'
ZPWR_VERBS[environmentvariables]='zpwrEnvVars=list all ZPWR env vars'
ZPWR_VERBS[envvarsall]='zpwrEnvVarsAll=list all env vars'
ZPWR_VERBS[environmentvarsall]='zpwrEnvVarsAll=list all env vars'
ZPWR_VERBS[environmentvariablesall]='zpwrEnvVarsAll=list all env vars'
ZPWR_VERBS[envcounts]='zpwrEnvCounts=count all ZPWR env'
ZPWR_VERBS[environmentcounts]='zpwrEnvCounts=count all ZPWR env'
ZPWR_VERBS[envcachesearch]='fzfEnv=search all cached aliases, parameters, builtins, keywords and functions'
ZPWR_VERBS[environmentcachesearch]='fzfEnv=search all cached aliases, parameters, builtins, keywords and functions'
ZPWR_VERBS[figletfonts]='figletfonts=show all figlet fonts'
ZPWR_VERBS[findsearch]='findFzfNoZLEC=c find drive for file'
ZPWR_VERBS[findsearchedit]='findFzfEditNoZLEC=c edit find drive for file'
ZPWR_VERBS[fordir]='fordir=run first arg in following dirs'
ZPWR_VERBS[fordirupdate]='fordirUpdate=run git updaters in following dirs'
ZPWR_VERBS[forgitadd]='forgit::add=forgit fzf add'
ZPWR_VERBS[forgitclean]='forgit::clean=forgit fzf clean'
ZPWR_VERBS[forgitdiff]='forgit::diff=forgit fzf diff'
ZPWR_VERBS[forgitignore]='forgit::ignore=forgit fzf ignore'
ZPWR_VERBS[forgitignoreclean]='forgit::ignore::clean=forgit fzf ignore clean'
ZPWR_VERBS[forgitignoreget]='forgit::ignore::get=forgit fzf ignore get'
ZPWR_VERBS[forgitignorelist]='forgit::ignore::list=forgit fzf ignore list'
ZPWR_VERBS[forgitignoreupdate]='forgit::ignore::update=forgit fzf ignoreupdate'
ZPWR_VERBS[forgitinfo]='forgit::info=forgit fzf info'
ZPWR_VERBS[forgitlog]='forgit::log=forgit fzf log'
ZPWR_VERBS[forgitreset]='forgit::reset::head=forgit fzf reset'
ZPWR_VERBS[forgitrestore]='forgit::restore=forgit fzf restore'
ZPWR_VERBS[forgitstash]='forgit::stash::show=forgit fzf stash'
ZPWR_VERBS[forgitwarn]='forgit::warn=forgit fzf warn'
ZPWR_VERBS[for]='fff=run first arg times for command'
ZPWR_VERBS[for10]='ff=run 10 times for command'
ZPWR_VERBS[forked]='fp=cd to ~/forkedRepos'
ZPWR_VERBS[fp]='fp=cd to ~/forkedRepos'
ZPWR_VERBS[ghcontribcount]='cgh=count of github contribs in last year'
ZPWR_VERBS[gitemail]='changeGitEmail=change email with git filter-brancch'
ZPWR_VERBS[gitcemail]='changeGitCommitterEmail=change committer email with git filter-brancch'
ZPWR_VERBS[gitaemail]='changeGitAuthorEmail=change author email with git filter-brancch'
ZPWR_VERBS[gitcommit]='gitCommitAndPush=commit and push with arg message'
ZPWR_VERBS[gitcommits]='commits=search git commits with fzf'
ZPWR_VERBS[gitcontribcount]='contribCount=count of git contribs by author'
ZPWR_VERBS[gitcontribcountdirs]='contribCountDirs=count of git contribs by author for list of dirs'
ZPWR_VERBS[gitcontribcountlines]='contribCountLines=count of lines contributed by author'
ZPWR_VERBS[gitclearcommit]='clearGitCommit=remove matching git commits from history'
ZPWR_VERBS[gitclearcache]='clearGitCache=clear old git refs and objects'
ZPWR_VERBS[gitdir]='isGitDir=check if pwd is git dir'
ZPWR_VERBS[gitupdatetag]='lcm=print tag and latest msg to BUFFER'
ZPWR_VERBS[gitedittag]='zpwrEditTag=print tag to BUFFER'
ZPWR_VERBS[gitfordirdevelop]='zfgdw=run git wipe to develop branch in git dirs in $PWD'
ZPWR_VERBS[gitfordirmaster]='zfgmw=run git wipe to master branch in git dirs in $PWD'
ZPWR_VERBS[gitforalldir]='zpwrForAllGitDirs=run cmd in all git dirs'
ZPWR_VERBS[github]='openmygh=open github profile'
ZPWR_VERBS[gitignore]='gil=vim ~/.git/info/exclude'
ZPWR_VERBS[gitlargest]='largestGitFiles=show largest files stored by git in descending order'
ZPWR_VERBS[gitremotes]='allRemotes=list all git remotes'
ZPWR_VERBS[gitreposdirty]='searchDirtyGitRepos=search dirty \$ZPWR_ALL_GIT_DIRS in fzf'
ZPWR_VERBS[gitrepos]='searchAllGitRepos=search \$ZPWR_ALL_GIT_DIRS in fzf'
ZPWR_VERBS[gitupdatefordir]='zpwrUpdateAllGitDirs=run git updates in all git dirs'
ZPWR_VERBS[gitzfordir]='zg=run git wipe on any branch $1 in git dirs in $PWD and z $2 if present'
ZPWR_VERBS[gitzfordirdevelop]='zd=z $1 if present and run git wipe to develop branch in git dirs in $PWD'
ZPWR_VERBS[gitzfordirmaster]='zm=z $1 if present and run git wipe to master branch in git dirs in $PWD'
ZPWR_VERBS[gittotallines]='totalLines=count of total line count of git files'
ZPWR_VERBS[grep]='fz=grep through pwd with ag into fzf'
ZPWR_VERBS[hidden]='cd $ZPWR_HIDDEN_DIR=go to zpwr \$ZPWR_HIDDEN_DIR'
ZPWR_VERBS[hist]='historyVerbAccept=exec history command'
ZPWR_VERBS[histedit]='historyVerbEdit=edit history command'
ZPWR_VERBS[home]='cd $ZPWR=go to zpwr \$ZPWR'
ZPWR_VERBS[homeautoload]='cd $ZPWR_AUTOLOAD=go to zpwr \$ZPWR_AUTOLOAD'
ZPWR_VERBS[homeautoloadcommon]='cd $ZPWR_AUTOLOAD_COMMON=go to zpwr \$ZPWR_AUTOLOAD_COMMON'
ZPWR_VERBS[homecomps]='cd $ZPWR_COMPS=go to zpwr \$ZPWR_COMPS'
ZPWR_VERBS[homeenv]='cd $ZPWR_ENV=go to zpwr \$ZPWR_ENV'
ZPWR_VERBS[homeinstall]='cd $ZPWR_INSTALL=go to zpwr \$ZPWR_INSTALL'
ZPWR_VERBS[homelocal]='cd $ZPWR_LOCAL=go to zpwr \$ZPWR_LOCAL'
ZPWR_VERBS[homescripts]='cd $ZPWR_SCRIPTS=go to zpwr \$ZPWR_SCRIPTS'
ZPWR_VERBS[hometest]='cd $ZPWR_TEST=go to zpwr \$ZPWR_TEST'
ZPWR_VERBS[hometests]='cd $ZPWR_TEST=go to zpwr \$ZPWR_TEST'
ZPWR_VERBS[hometmux]='cd $ZPWR_TMUX=go to zpwr \$ZPWR_TMUX'
ZPWR_VERBS[hubcreate]='hc=create remote github repo'
ZPWR_VERBS[hubdelete]='hd=delete remote github repo'
ZPWR_VERBS[info]='clearList=get info on command type with args'
ZPWR_VERBS[install]='inst=run configure, make and make install'
ZPWR_VERBS[kill]='killPSVerbAccept=kill from ps output'
ZPWR_VERBS[killedit]='killPSVerbEdit=edit kill from ps output'
ZPWR_VERBS[killmux]='tmux kill-server=kill tmux server'
ZPWR_VERBS[killremote]='tmux kill-server;killall ssh autossh=kill tmux server and ssh'
ZPWR_VERBS[linecount]='zpwrLineCount=get line count of search term from command'
ZPWR_VERBS[list]='listNoClear=list the files with no args'
ZPWR_VERBS[loadjenv]='loadJenv=lazy load jenv, calls jenv $@'
ZPWR_VERBS[locatesearch]='locateFzfNoZLEC=accept locate drive for file'
ZPWR_VERBS[locatesearchedit]='locateFzfEditNoZLEC=edit locate drive for file'
ZPWR_VERBS[log]='logg=write to \$ZPWR_LOGFILE'
ZPWR_VERBS[logdebug]='loggDebug=write debug to \$ZPWR_LOGFILE'
ZPWR_VERBS[logerror]='loggErr=write error to console'
ZPWR_VERBS[loginfo]='loggInfo=write info to console'
ZPWR_VERBS[logincount]='loginCount=count of logins by user'
ZPWR_VERBS[lsof]='killLsofVerbAccept=kill from lsof output'
ZPWR_VERBS[lsofedit]='killLsofVerbEdit=edit kill from lsof output'
ZPWR_VERBS[ls]='listNoClear=list the files with no args'
ZPWR_VERBS[makedir]='jd=make a dir tree'
ZPWR_VERBS[makefile]='j=make a dir tree with file at end'
ZPWR_VERBS[man]='fm=fzf through man pages'
ZPWR_VERBS[mygithub]='openmygh=open github profile'
ZPWR_VERBS[open]='o=open with system'
ZPWR_VERBS[opencommand]='getOpenCommand=get the command to open with system'
ZPWR_VERBS[pastecommand]='getPasteCommand=get the command to paste with system'
ZPWR_VERBS[pastebuffer]='zpwrPasteToBuffer=paste clipboard to BUFFER'
ZPWR_VERBS[pi]='pi=ping all LAN devices'
ZPWR_VERBS[pir]='pir=run command on all devices'
ZPWR_VERBS[plugins]='zpl=cd to \$ZSH_CUSTOM/plugins'
ZPWR_VERBS[poll]='zpwrPoll=poll git remote and run command'
ZPWR_VERBS[post]='post=postfix all output'
ZPWR_VERBS[pre]='pre=prefix all output'
ZPWR_VERBS[prettyprint]='prettyPrint=pretty print with color'
ZPWR_VERBS[ps]='p=ps -ef | grep arg'
ZPWR_VERBS[pygmentcolors]='pygmentcolors=show all pygment colors'
ZPWR_VERBS[recompile]='recompile=recompile all cache comps'
ZPWR_VERBS[regen]='regenMost=regen caches except git drive search'
ZPWR_VERBS[regenall]='regenAll=regen all caches'
ZPWR_VERBS[regenenvcache]='regenSearchEnv=regen search env to $ZPWR/zpwrEnv{Key,Value}.txt'
ZPWR_VERBS[regengit]='regenAllGitRepos=regen list of all git repos to \$ZPWR_ALL_GIT_DIRS'
ZPWR_VERBS[regenhistory]='regenHistory=regen \$HISTFILE'
ZPWR_VERBS[restorehistory]='zpwrRestoreHistfile=restore \$HISTFILE'
ZPWR_VERBS[regenkeybindings]='regenAllKeybindingsCache=regen all keybindings cache to $ZPWR/zpwr{All,Vim}Keybindings.txt'
ZPWR_VERBS[rmconfiglinks]='unlinkConf=remove sym links from \$ZPWR_INSTALL to \$HOME'
ZPWR_VERBS[regenconfiglinks]='regenConfigLinks=regen sym links from \$ZPWR_INSTALL to \$HOME'
ZPWR_VERBS[regenpowerline]='regenPowerlineLink=regen powerline sym link to \$HOME/.tmux/powerline'
ZPWR_VERBS[regengtags]='regenGtagsCtags=regen gtags files to \$HOME'
ZPWR_VERBS[regenctags]='regenCtags=regen ctags files to \$HOME'
ZPWR_VERBS[regenzsh]='regenZshCompCache=regen compsys cache to \$ZSH_COMPDUMP'
ZPWR_VERBS[reload]='zpwrReload=reparse env'
ZPWR_VERBS[repo]='zp=cd to \$ZPWR_REPO_NAME'
ZPWR_VERBS[return2]='return2=turn off stderr filter'
ZPWR_VERBS[reveal]='reveal=show remote repo in browser'
ZPWR_VERBS[runtests]='tru=run all zpwr tests'
ZPWR_VERBS[scriptcount]='zpwrScriptCount=total number of scripts in \$ZPWR'
ZPWR_VERBS[scriptlist]='zpwrScriptList=total list of scripts in \$ZPWR'
ZPWR_VERBS[scripts]='zs=cd to scripts directory'
ZPWR_VERBS[scriptToPDF]='scriptToPDF=convert script to PDF'
ZPWR_VERBS[search]='s=search google for args'
ZPWR_VERBS[start]='tmm_notabs=start with no tabs'
ZPWR_VERBS[starttabs]='tmm_full=start all tabs'
ZPWR_VERBS[subcommands]='zpwrVerbsNoZLE=run the subcommands for zpwr <tab>'
ZPWR_VERBS[subcommandsedit]='zpwrVerbsEditNoZLE=edit the subcommands for zpwr <tab>'
ZPWR_VERBS[subcommandsfzf]='zpwrVerbsFZF=fzf the subcommands for zpwr <tab>'
ZPWR_VERBS[subcommandslist]='zpwrListVerbs=the subcommands for zpwr <tab>'
ZPWR_VERBS[subcommandscount]='zpwrNumVerbs=number of choice for zpwr <tab>'
ZPWR_VERBS[taillog]='lo=tail -F \$ZPWR_LOGFILE'
ZPWR_VERBS[test]='tru=run all zpwr tests'
ZPWR_VERBS[tests]='tru=run all zpwr tests'
ZPWR_VERBS[timer]='timer=timer one or more commands'
ZPWR_VERBS[to]='to=toggle external ip'
ZPWR_VERBS[tokens]='tok=vim the .tokens.sh file'
ZPWR_VERBS[toggle]='to=toggle external ip'
ZPWR_VERBS[travis]='trav-git=open current travis project in browser'
ZPWR_VERBS[travisbuild]='trav-git-build=open current travis builds in browser'
ZPWR_VERBS[travisbranch]='trav-git-br=open current travis branches in browser'
ZPWR_VERBS[travispr]='trav-git-pr=open current travis PRs in browser'
ZPWR_VERBS[trc]='trc=tmux.conf vim session'
ZPWR_VERBS[uninstall]='zpwrUninstall=uninstall all zpwr configs'
ZPWR_VERBS[uncompile]='uncompile=delete all cache comps'
ZPWR_VERBS[update]='getrc=update zpwr custom configs'
ZPWR_VERBS[updateall]='zpwrAllUpdates=update zpwr custom configs and deps'
ZPWR_VERBS[updatedeps]='apz=update all dependencies'
ZPWR_VERBS[updatezinit]='zpwrZinitUpdates=update zinit dependencies'
ZPWR_VERBS[upload]='upload=upload with curl'
ZPWR_VERBS[urlsafe]='urlSafe=base64 encode'
ZPWR_VERBS[verbs]='zpwrVerbsNoZLE=run the subcommands for zpwr <tab>'
ZPWR_VERBS[verbsedit]='zpwrVerbsEditNoZLE=edit the subcommands for zpwr <tab>'
ZPWR_VERBS[verbsfzf]='zpwrVerbsFZF=fzf the subcommands for zpwr <tab>'
ZPWR_VERBS[verbslist]='zpwrListVerbs=list the subcommands for zpwr <tab>'
ZPWR_VERBS[verbscount]='zpwrNumVerbs=number of choice for zpwr <tab>'
ZPWR_VERBS[vimall]='vimAll=vim all zpwr files for :argdo'
ZPWR_VERBS[vimconfig]='conf=edit all zpwr configs'
ZPWR_VERBS[vimemacsconfig]='vimEmacsConfig=vim edit emacs zpwr configs'
ZPWR_VERBS[vimscripts]='vimScripts=vim all zpwr scripts for :argdo'
ZPWR_VERBS[vimscriptedit]='vimScriptEdit=vim edit 1 or more scripts'
ZPWR_VERBS[vimalledit]='vimAllEdit=vim edit 1 or more configs'
ZPWR_VERBS[vimautoload]='vimAutoload=vim all autoloads :argdo'
ZPWR_VERBS[vimcd]='cv=vim edit and cd to first dir'
ZPWR_VERBS[vimrecent]='vimRecent=choose most recent vim files'
ZPWR_VERBS[vimrecentsudo]='sudoVimRecent=sudo chooose most vim recent files'
ZPWR_VERBS[vimsearch]='fzfVimKeybind=search vim keybindings'
ZPWR_VERBS[vimtests]='zpt=edit all zpwr tests'
ZPWR_VERBS[vimtokens]='tok=vim the .tokens.sh file'
ZPWR_VERBS[vimctags]='vimZpwrCtags=vim zpwr ctags tags'
ZPWR_VERBS[vimgtags]='vimZpwrGtags=vim zpwr GNU global tags'
ZPWR_VERBS[vimgtagsedit]='vimZpwrGtagsEdit=vim edit zpwr GNU global tags'
ZPWR_VERBS[vimfindsearch]='findFzfNoZLEVim=vim accept find drive for file'
ZPWR_VERBS[vimfindsearchedit]='findFzfEditNoZLEVim=vim edit find drive for file'
ZPWR_VERBS[vimlocatesearch]='locateFzfNoZLEVim=vim accept locate drive for file'
ZPWR_VERBS[vimlocatesearchedit]='locateFzfEditNoZLEVim=vim edit locate drive for file'
ZPWR_VERBS[vimwordsearch]='vimFzfWordsearchVerb=vim a file in a sub dir by word'
ZPWR_VERBS[vimwordsearchedit]='vimFzfWordsearchVerbEdit=edit vim a file in a sub dir by word'
ZPWR_VERBS[vimfilesearch]='vimFzfFilesearchVerb=vim a file in a sub dir'
ZPWR_VERBS[vimfilesearchedit]='vimFzfFilesearchVerbEdit=edit vim a file in a sub dir'
ZPWR_VERBS[vimplugincount]='zpwrVimPluginCount=total number of vim plugins in \$ZPWR'
ZPWR_VERBS[vimpluginlist]='zpwrVimPluginList=total list of vim plugins in \$ZPWR'
ZPWR_VERBS[vrc]='vrc=vimrc vim session'
ZPWR_VERBS[whiletrue]='ww=run command forever'
ZPWR_VERBS[whilesleep]='www=run command and sleep first arg seconds'
ZPWR_VERBS[web]='we=cd to web dir'
ZPWR_VERBS[zp]='zp=cd to \$ZPWR_REPO_NAME'
ZPWR_VERBS[zpwr]='zp=cd to \$ZPWR_REPO_NAME'
ZPWR_VERBS[zpwrgithub]='zpgh=open zpwr github'
ZPWR_VERBS[zpz]='zpz=cd to \$ZPWR_REPO_NAME and git checkout other branch, rebase and push'
ZPWR_VERBS[zrc]='zrc=zshrc vim session'
ZPWR_VERBS[zshplugincount]='zpwrZshPluginCount=total number of zsh plugins in \$ZPWR'
ZPWR_VERBS[zshpluginlist]='zpwrZshPluginList=total list of zsh plugins in \$ZPWR'
ZPWR_VERBS[zshsearch]='zshrcsearch=search zshrc for arg'
ZPWR_VERBS[zstyle]='zpwrZstyle=fuzzy search zstyle'
ZPWR_VERBS[zcd]='fzfZListVerb=list then cd to z frecency ranked dir'
ZPWR_VERBS[z]='z=cd to z frecency ranked dir'

if commandExists systemctl; then
    ZPWR_VERBS[serviceup]='ssu=start and enable systemd service'
    ZPWR_VERBS[servicedown]='ssd=stop and disable systemd service'
fi

verb="$1"

if [[ -n "$verb" ]]; then

    shift
    if [[ $verb =~ '-V|--version' ]]; then
        about | less
        return 0
    fi

    if [[ $verb =~ '-h|--help' ]]; then
        zpwrListVerbs | less
        return 0
    fi

    while [[ $verb == '--' ]]; do
        verb="$1"
        shift
    done

    if [[ $(basename -- $verb) == $(basename -- $0) ]]; then
        #zunit does this
        return 0
    fi

    found=false

    for k v in ${(kv)ZPWR_VERBS[@]};do

        if [[ $k == $verb ]]; then
            found=true
            cmd=${v%%=*}
            for exp in ${(s%;%)cmd}; do
                if alias $exp 1>/dev/null 2>&1;then
                    logg "Eval subcommand '$exp'"
                    eval "$exp"
                    ret=$?
                else
                    logg "Exec subcommand '$exp'"
                    eval "$exp " ${(q)@}
                    ret=$?
                fi
            done
            break
        fi
    done

    if [[ $found == false ]]; then
        loggErr "Unknown subcommand: '$verb'"
        return 1
    fi

    return $ret
fi

