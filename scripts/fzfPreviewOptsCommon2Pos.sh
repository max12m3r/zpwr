#!/usr/bin/env bash
#{{{                    MARK:Header
#**************************************************************
##### Author: MenkeTechnologies
##### GitHub: https://github.com/MenkeTechnologies
##### Date: Thu Sep  5 22:34:56 EDT 2019
##### Purpose: bash script to
##### Notes: no single quotes
#}}}***********************************************************
if [[ -n "$ZPWR" && -n "$ZPWR_LIB_INIT" ]]; then
    if ! source "$ZPWR_LIB_INIT" ""; then
        echo "Could not source dir '$ZPWR_LIB_INIT'."
        exit 1
    fi
else
    source="${BASH_SOURCE[0]}"
    while [ -h "$source" ]; do # resolve $source until the file is no longer a symlink
    zpwrBaseDir="$( cd -P "$( dirname "$source" )" >/dev/null 2>&1 && pwd )"
    source="$(readlink "$source")"
    [[ $source != /* ]] && source="$zpwrBaseDir/$source" # if $source was a relative symlink, we need to resolve it relative to the path where the symlink file was located
    done
    zpwrBaseDir="$( cd -P "$( dirname "$source" )" >/dev/null 2>&1 && pwd )"

    while [[ ! -f "$zpwrBaseDir/.zpwr_root" ]]; do
        zpwrBaseDir="$(dirname "$zpwrBaseDir")"
        if [[ "$zpwrBaseDir" == / ]]; then
            echo "Could not find .zpwr_root file up the directory tree." >&2
            exit 1
        fi
    done
    if ! source "$zpwrBaseDir/scripts/init.sh" "$zpwrBaseDir"; then
        echo "Could not source zpwrBaseDir '$zpwrBaseDir/scripts/init.sh'."
        exit 1
    fi

    unset zpwrBaseDir
fi

exists rpm && rpm_cmd='{ rpm -qi $file; rpm -qlp $file; }' || rpm_cmd="stat"
exists dpkg && deb_cmd='{ dpkg -I $file; dpkg -c $file; }' || deb_cmd="stat"

os="$(uname -s)"
if echo "$os" | grep -iq darwin; then
    nmcmd="nm"
elif echo "$os" | grep -iq linux; then
    nmcmd="nm -D"
else
    nmcmd="nm"
fi

casestr=$(cat<<EOF
            base=\${file##*/}
            case \$base in
                (*.txt)
                    $FZF_COLORIZER_FILE_TEXT 2>/dev/null;
                    ;;
                ([!.]*.*)
                    $FZF_COLORIZER_FILE 2>/dev/null;
                    ;;
                (.*.*)
                    $FZF_COLORIZER_FILE 2>/dev/null;
                    ;;
                (*)
                    $FZF_COLORIZER_FILE_DEFAULT 2>/dev/null;
                    ;;
            esac

EOF
    )


cat<<EOF
test -z \$file && file=\$(echo {} | cut -d" " -f2 | sed "s@^~@$HOME@");
if test -f \$file;then
    if print -r -- \$file | command egrep -iq "\\.[jw]ar\$";then jar tf \$file | $FZF_COLORIZER_JAVA;
    elif print -r -- \$file | command egrep -iq "\\.(tgz|tar|tar\\.gz)\$";then tar tf \$file | $FZF_COLORIZER_C;
    elif print -r -- \$file | command egrep -iq "\\.deb\$";then $deb_cmd | $FZF_COLORIZER_SH;
    elif print -r -- \$file | command egrep -iq "\\.rpm\$";then $rpm_cmd | $FZF_COLORIZER_SH;
    elif print -r -- \$file | command egrep -iq "\\.zip\$";then unzip -v -- \$file | $FZF_COLORIZER_C;
    elif print -r -- \$file | command egrep -iq "\\.(bzip|bz)\$";then bzip -c -d \$file | $FZF_COLORIZER_YAML;
    elif print -r -- \$file | command egrep -iq "\\.(bzip2|bz2)\$";then bzip2 -c -d \$file | $FZF_COLORIZER_YAML;
    elif print -r -- \$file | command egrep -iq "\\.(xzip|xz)\$";then xz -c -d \$file | $FZF_COLORIZER_YAML;
    elif print -r -- \$file | command egrep -iq "\\.(gzip|gz)\$";then gzip -c -d \$file | $FZF_COLORIZER_YAML;
    elif print -r -- \$file | command egrep -iq "\\.(so|dylib).*\$";then
        $ZPWR_FZF_CLEARLIST
        $nmcmd \$file | $FZF_COLORIZER_YAML
        xxd \$file | $FZF_COLORIZER_YAML
    else
EOF
