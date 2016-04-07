
## just run standalone container
docker run --cap-add=ALL \
           -d -p 53:53/udp -p 53:53/tcp -p 953:953/tcp \
            bind-dev:p2-new
