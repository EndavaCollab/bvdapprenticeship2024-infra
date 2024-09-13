mkdir -p ~/.sslcerts

echo "$SSL_CERT" > ~/.sslcerts/cert.pem
echo "$SSL_CHAIN" > ~/.sslcerts/chain.pem
echo "$SSL_FULLCHAIN" > ~/.sslcerts/fullchain.pem
echo "$SSL_PRIVKEY" > ~/.sslcerts/privkey.pem
