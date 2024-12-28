# Check if docker-compose.yml file exists
if [ -f "docker-compose.yml" ]; then
    echo "docker-compose.yml file found. Proceeding with Docker Compose actions."

    # Bring up Docker services defined in the docker-compose.yml
    docker-compose up -d

else
    echo "docker-compose.yml file not found. Skipping Docker Compose actions."
fi

# Define an array with storage paths
storage_paths=("Mongodb" "OpenSearch" "Redis" "Postgre")

# Loop through the array and create directories
for dir_name in "${storage_paths[@]}"
do
    if [ -d "$dir_name" ]; then
        echo "$dir_name already exists."
    else
        mkdir -p "$dir_name"  # -p ensures no error if the directory already exists
        echo "$dir_name created."
    fi
done