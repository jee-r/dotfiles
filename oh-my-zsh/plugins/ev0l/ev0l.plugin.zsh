function beets_import_unsorted() {
  
  
  tmux_session_name="beet_unsorted"

  tmux has-session -t $tmux_session_name

  if [ $? != 0 ]; then
    tmux new-session -s "$tmux_session_name" sudo  docker-compose --file /volume1/docker/beets/docker-compose.yml exec flac ./config/scripts/clean_unsorted.sh
  else
    tmux attach-session -t "$tmux_session_name"
  fi
}

