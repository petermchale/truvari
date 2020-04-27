for url in $(cat urls.txt); do
  wget --background --no-clobber $url
done
