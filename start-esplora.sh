cp -r ./data ./tmp-data
docker compose up -d
mkdir -p logs
docker compose logs -f > logs/docker.log 2>&1 &

# wait for esplora to be ready
for i in {1..24}; do
  curl --fail -X GET http://localhost:8094/regtest/api/blocks/tip/height && break || sleep 1
done
