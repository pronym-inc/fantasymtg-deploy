cd -- "$(dirname "$BASH_SOURCE")/.."
vagrant ssh -c "sudo sudo -u fantasymtg HOME=/home/fantasymtg git -C /webapps/fantasymtg/src/fantasymtg add /webapps/fantasymtg/src/fantasymtg"
echo "Enter commit message:"
read commitmsg
vagrant ssh -c "sudo sudo -u fantasymtg HOME=/home/fantasymtg git -C /webapps/fantasymtg/src/fantasymtg commit -am '$commitmsg'"
vagrant ssh -c "sudo sudo -u fantasymtg HOME=/home/fantasymtg git -C /webapps/fantasymtg/src/fantasymtg push"
echo "Git commit complete!"