########## GENERAL ALIASES
alias g="python manage.py runserver"
alias whatip="curl canhazip.com"
function va () { vim ~/.bash_aliases; }
function sa () { source ~/.bash_aliases; }
function vb () { vim ~/.bash_profile; }
function sb () { source ~/.bash_profile; }
function vv () { vim ~/.vimrc; }
function zappashell()
{
    docker run -ti -e AWS_PROFILE=$1 -v $(pwd):/var/task -v ~/.aws:/root/.aws --rm zappa bash
}
########## END GENERAL ALIASES

########## GIT FUNCTIONS
function idgaf () { git push --force; }
function up () { git pull --rebase --prune $@ && git submodule update --init --recursive; }
function gs () { git status; }
alias gd="git diff --color | sed -E 's/^([^-+ ]*)[-+ ]/\\1/' | less -r"
alias gl="git log"
function gri () { git rebase --interactive "$1"; }
function gt () { git log --graph --oneline --decorate; }
function ga () { git add $1; }
function gca () { git commit --all; }
function gcam () { git commit --all -m "$1"; }
function gcm () { git commit -m "$1"; }
function gcp () { git commit --patch; }
function gcpc () { git cherry-pick --continue; }
function grc () { git rebase --continue; }
function gb () { git branch; }
function gp () { git pull --ff-only; }
git_clean_branches ()
{
    current_branch=$(git name-rev --name-only HEAD)
    git pull;
    git branch --merged ${current_branch} | grep -Ev "\* ${current_branch}|master|test|develop" | xargs -n 1 git branch -d;
}
########## END GIT FUNCTIONS

########## MAC CONVENIENCE ALIASES
alias cp="cp -iv"
alias mv="mv -iv"
alias finder="open -a Finder ./"
alias printxrefenv="printenv | grep 'XREF\|REDSHIFT'"
alias ll='ls -FGlAhp'
cd() { builtin cd "$@"; ll; }
########## END MAC CONVENIENCE ALIASES
