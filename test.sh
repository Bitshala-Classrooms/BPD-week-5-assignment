# Copy data directory to a temporary directory
cp -r ./data ./tmp-data

# Spawn Bitcoind, and provide execution permission.
docker compose up -d
chmod +x ./bash/run-bash.sh
chmod +x ./python/run-python.sh
chmod +x ./javascript/run-javascript.sh
chmod +x ./rust/run-rust.sh
chmod +x ./run.sh

# Run the test scripts
/bin/bash run.sh
npm run test
docker compose down -v

# Remove the temporary directory
rm -rf ./tmp-data