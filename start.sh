#!/bin/bash
# start.sh

# Make the script executable
chmod +x start.sh

# Check if the project already exists
if [ ! -d "src" ]; then
    echo "Creating new Vite React project..."
    # Start containers
    docker compose up -d
    
    # Create new Vite project
    docker compose exec vite_dev npm create vite@latest . -- --template react
    
    # Install dependencies
    docker compose exec vite_dev npm install
    
    # Update vite.config.js to allow external access
    docker compose exec vite_dev bash -c 'echo "import { defineConfig } from \"vite\";
import react from \"@vitejs/plugin-react\";

export default defineConfig({
  plugins: [react()],
  server: {
    host: \"0.0.0.0\",
    port: 5173,
  },
});" > vite.config.js'

    echo "Project created successfully!"
else
    echo "Project already exists, starting containers..."
    docker compose up -d
fi

docker compose exec vite_dev npm run dev
