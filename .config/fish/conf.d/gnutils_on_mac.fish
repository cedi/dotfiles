if string match -q "darwin*" $OSTYPE
    if type -q ggrep; alias indent=ggrep; end
    if type -q gindent; alias indent=gindent; end
    if type -q gtar; alias tar=gtar; end
    if type -q gsed; alias sed=gsed; end
    if type -q gawk; alias awk=gawk; end
    if type -q gmake; alias make=gmake; end
    if type -q gfind; alias find=gfind; end
    if type -q gwhich; alias which=gwhich; end
end