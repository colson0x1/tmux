#!/bin/zsh

# My :goto Websites and Apps
targets=(
 "Google:https://www.google.com" 
 "GitHub:https://github.com/colson0x1" 
 "Stack Overflow:https://stackoverflow.com"
 "YouTube:https://youtube.com"
 "Spotify:spotify"
 "Instagram:https://instagram.com"
 "Messenger:https://messenger.com"
 "Gmail:https://mail.google.com"
 "Hacker News:https://news.ycombinator.com"
 "LinkedIn:https://www.linkedin.com"
 "TechCrunch:https://techcrunch.com"
 "Chrome:google-chrome" 
 "VSCode:code" 
 "Postman:postman" 
 "IntelliJ IDEA:intellij" 
 "WebStorm:webstorm" 
 "Terminal:terminal" 
)

open_target() {
  if [[ $1 == http* ]]; then
    if command -v xdg-open &> /dev/null; then
      xdg-open "$1"  # Linux - 'xdg-open'
    elif command -v open &> /dev/null; then
      open "$1"  # macOS - 'open'
    else
      echo "Cannot open the link: $1"
    fi
  else
    case "$1" in
      spotify)
        open -a "Spotify" "spotify:" # Open Spotify on macOS
        ;;
      google-chrome)
        open -a "Google Chrome" # Open Chrome on macOS
        ;;
      code)
        open -a "Visual Studio Code" # Open VSCode on macOS
        ;;
      postman)
        open -a "Postman" # Open Postman on macOS
        ;;
      intellij)
        open -a "IntelliJ IDEA" # Open IntelliJ IDEA on macOS
        ;;
      webstorm)
        open -a "WebStorm" # Open WebStorm on macOS
        ;;
      terminal)
        tmux new-window # Open a new Tmux window
        ;;
      *)
        echo "Application not found or not supported: $1"
        ;;
    esac
  fi
}

selected_target=$(printf "%s\n" "${targets[@]}" | fzf --delimiter=':' --preview='echo {2}')

if [ -n "$selected_target" ]; then
  open_target "${selected_target#*:}"
fi
