#!/usr/bin/env bash
#{{{ MARK:Header
#**************************************************************
##### Author: MenkeTechnologies
##### GitHub: https://github.com/MenkeTechnologies
##### Date: Wed Sep 18 15:53:09 EDT 2019
##### Purpose: bash script to run zpwr subcommands
##### Notes: escape $ in comments for perl subs
#}}}***********************************************************

verb="$1"
shift
case $verb in
    allsearch) cmd="fzfAllKeybind" #search all keybindings
        ;;
    altprettyprint) cmd="alternatingPrettyPrint" #pretty with alternating color
        ;;
    attach) cmd="tmux attach-session" #attach to tmux session
        ;;
    background) cmd="b" #run arg in background
        ;;
    backup) cmd="backup" #backup files
        ;;
    banner) cmd="about" #show $ZPWR_REPO_NAME banner
        ;;
    brc) cmd="brc" #shell aliases file vim session
        ;;
    cd) cmd="f" #cd to directory arg
        ;;
    clearlist) cmd="clearList" #clear and list the files with no args
        ;;
    clone) cmd="gcl" #clone and cd to arg
        ;;
    cloneToForked) cmd="cloneToForked" #clone \$ZPWR_REPO_NAME to \$FORKED_DIR
        ;;
    colorsdiff) cmd="gsdc" #colorized side diff
        ;;
    color2) cmd="color2" #turn on stderr filter
        ;;
    commit) cmd="gitCommitAndPush" #commit and push with arg message
        ;;
    commits) cmd="commits" #search git commits with fzf
        ;;
    contribcount) cmd="contribCount" #count of git contribs by author
        ;;
    contribcountdirs) cmd="contribCountDirs" #count of git contribs by author for list of dirs
        ;;
    contribcountlines) cmd="contribCountLines" #count of lines contributed by author
        ;;
    copycommand) cmd="getCopyCommand" #get the command to copy with system
        ;;
    detach) cmd="detachall" #detach from all tmux sessions
        ;;
    digs) cmd="digs" #run series on networking commands on arg
        ;;
    drivesearch) cmd="locateFzf" #search drive for file
        ;;
    envsearch) cmd="fzfEnv" #search all aliases, parameters, builtins, keywords and functions
        ;;
    figletfonts) cmd="figletfonts" #show all figlet fonts
        ;;
    ff) cmd="ff" #run 10 times for command
        ;;
    fff) cmd="fff" #run first arg times for command
        ;;
    fp) cmd="fp" #cd to ~/forkedRepos
        ;;
    ghcontribcount) cmd="cgh" #count of github contribs in last year
        ;;
    github) cmd="openmygh" #open github.com profile
        ;;
    gitignore) cmd="gil" #vim ~/.git/info/exclude
        ;;
    gitremotes) cmd="allRemotes" #list all git remotes
        ;;
    grep) cmd="fz" #grep through pwd with ag into fzf
        ;;
    home) cmd="cd $ZPWR_HIDDEN_DIR" #go to zpwr \$ZPWR_HIDDEN_DIR
        ;;
    hubcreate) cmd="hc" #create remote github repo
        ;;
    hubdelete) cmd="hd" #delete remote github repo
        ;;
    info) cmd="clearList" #get info on command type with args
        ;;
    install) cmd="inst" #run configure, make and make install
        ;;
    killmux) cmd="tmux kill-server" #kill tmux server
        ;;
    learn) cmd="learn" #save learning to \$ZPWR_SCHEMA_NAME.\$ZPWR_TABLE_NAME
        ;;
    learnsearch) cmd="se" #search for learning in \$ZPWR_SCHEMA_NAME.\$ZPWR_TABLE_NAME
        ;;
    list) cmd="listNoClear" #list the files with no args
        ;;
    log) cmd="logg" #write to \$ZPWR_LOGFILE
        ;;
    logincount) cmd="loginCount" #count of logins by user
        ;;
    makedir) cmd="jd" #make a dir tree
        ;;
    makefile) cmd="j" #make a dir tree with file at end
        ;;
    man) cmd="fm" #fzf through man pages
        ;;
    open) cmd="o" #open with system
        ;;
    opencommand) cmd="getOpenCommand" #get the command to open with system
        ;;
    pastecommand) cmd="getPasteCommand" #get the command to paste with system
        ;;
    pi) cmd="pi" #ping all LAN devices
        ;;
    pir) cmd="pir" #run command on all devices
        ;;
    plugins) cmd="zpl" #cd to ~/.oh-my-zsh/custom/plugins
        ;;
    post) cmd="post" #postfix all output
        ;;
    pre) cmd="pre" #prefix all output
        ;;
    ps) cmd="p" #ps -ef | grep arg
        ;;
    pygmentcolors) cmd="pygmentcolors" #show all pygment colors
        ;;
    recompile) cmd="recompile" #recompile all cache comps
        ;;
    regen) cmd="regenAll" #regen all caches
        ;;
    regenenv) cmd="regenSearchEnv" #regen search env to ~/.zpwr/zpwrEnv{Key,Value}.txt
        ;;
    regengit) cmd="regenAllGitRepos" #regen list of all git repos to ~/.zpwr/zpwrGitDirs.txt
        ;;
    regenkeybindings) cmd="regenAllKeybindingsCache" #regen all keybindings cache to ~/.zpwr/zpwr{All,Vim}Keybindings.txt
        ;;
    regenpowerline) cmd="regenPowerlineLink" #regen powerline sym link to ~/.tmux/powerline
        ;;
    regentags) cmd="regenTags" #regen ctags files to ~ and ~/.zpwr/scripts
        ;;
    regenzsh ) cmd="regenZshCompCache" #regen compsys cache to ~/.zcompdump
        ;;
    return2) cmd="return2" #turn off stderr filter
        ;;
    reveal) cmd="reveal" #show remote repo in browser
        ;;
    scriptcount) cmd="scriptCount" #total number of scripts in \$ZPWR_SCRIPTS
        ;;
    scripts) cmd="sc" #cd to scripts directory
        ;;
    scriptToPDF) cmd="scriptToPDF" #convert script to PDF
        ;;
    search) cmd="s" #search google for args
        ;;
    start) cmd="tmm_notabs" #start with no tabs
        ;;
    starttabs) cmd="tmm_full" #start all tabs
        ;;
    taillog) cmd="lo" #tail -F \$ZPWR_LOGFILE
        ;;
    timer) cmd="timer" #timer one or more commands
        ;;
    to) cmd="to" #toggle external ip
        ;;
    totallines) cmd="totalLines" #count of total line count of git files
        ;;
    trc) cmd="trc" #tmux.conf vim session
        ;;
    update) cmd="getrc" #update zpwr custom configs
        ;;
    updateall) cmd="zpwrAllUpdates" #update zpwr custom configs and deps
        ;;
    updatedeps) cmd="apz" #update all dependencies
        ;;
    upload) cmd="upload" #upload with curl
        ;;
    urlsafe) cmd="urlSafe" #base64 encode
        ;;
    prettyprint) cmd="prettyPrint" #pretty print with color
        ;;
    vimall) cmd="vimAll" #vim all zpwr files for :argdo
        ;;
    vimsearch) cmd="fzfVimKeybind" #search vim keybindings
        ;;
    vrc) cmd="vrc" #vimrc vim session
        ;;
    www) cmd="www" #run command and sleep first arg seconds
        ;;
    web) cmd="we" #cd to web dir
        ;;
    zp) cmd="zp" #cd to \$ZPWR_REPO_NAME
        ;;
    zpz) cmd="zpz" #cd to \$ZPWR_REPO_NAME and git co, rebase and push
        ;;
    zrc) cmd="zrc" #zshrc vim session
        ;;
    zshsearch) cmd="zshrcsearch" #search zshrc for arg
        ;;
    *) cmd="bad$$"
        ;;
esac

if [[ "$cmd" == "bad$$" ]]; then
    prettyPrint "Unknown subcommand: '$verb'"
else
    for exp in ${(s%;%)cmd}; do
        if alias $exp 1>/dev/null 2>&1;then
            prettyPrint "Eval subcommand '$exp'"
            eval "$exp"
        else
            prettyPrint "Exec subcommand '$exp'"
            ${=exp} $@
        fi
    done
fi

