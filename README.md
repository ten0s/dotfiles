## Generate a new ssh key and add it to github.com

<pre>
ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
</pre>

## Adjust /etc/sudoers

<pre>
sudo visudo
</pre>

- Disable secure_path

<pre>
#Defaults secure_path=...
</pre>

- Make sudo work w/o password

<pre>
%sudo ALL=NOPASSWD: ALL
</pre>

## Bootstrap

<pre>
curl https://raw.githubusercontent.com/ten0s/dotfiles/master/bootstrap.sh | bash
</pre>

## Clone dotfiles

<pre>
cd ~
git clone git@github.com:ten0s/dotfiles.git
</pre>

## Provision

<pre>
cd ~/dotfiles
./provision.sh [common | erl | ...]
</pre>
