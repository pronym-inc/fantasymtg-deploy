cd -- "$(dirname "$BASH_SOURCE")/.."
echo "Your email: "
read email
echo "Your name: "
read name
vagrant ssh -c "sudo sudo -u fantasymtg HOME=/home/fantasymtg git -C /webapps/fantasymtg/src/fantasymtg config --global user.email $email"
vagrant ssh -c "sudo sudo -u fantasymtg HOME=/home/fantasymtg git -C /webapps/fantasymtg/src/fantasymtg config --global user.name '$name'"
echo "Git config update complete!"