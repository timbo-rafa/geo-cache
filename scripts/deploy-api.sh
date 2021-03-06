CA_CLUSTER_IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ca-cluster)
BR_CLUSTER_IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' br-cluster)

echo "Starting cache_api"
docker run -d --name cache_api \
    -p 5000:5000 \
    -e CA_CLUSTER_IP=$CA_CLUSTER_IP \
    -e BR_CLUSTER_IP=$BR_CLUSTER_IP \
    timborafa/geo-cache-api

echo "Success!"