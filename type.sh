tmux kill-session -t typer
tmux new -s typer -d
tmux send-keys -t typer "asciinema rec" Enter
sleep 5

STRING="echo hello"

for WORD in $STRING
do
  for LTR in $(echo $WORD | sed -e 's/\(.\)/\1\n/g')
  do
    tmux send-keys -t typer $LTR
    sleep 0.2
  done
  tmux send-keys -t typer Space
done
tmux send-keys -t typer Enter
tmux attach -t typer
