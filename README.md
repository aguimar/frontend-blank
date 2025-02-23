# Docker Vite React Development Environment

This project provides a ready-to-use development environment for React applications using Vite, all containerized with Docker. Developers can start coding immediately without worrying about local dependencies or configuration.

## Features

- 🐳 Fully containerized development environment
- ⚡ Vite for fast development and building
- 🔄 Hot reload support
- 🛠️ Development and Production configurations
- 🚀 Easy deployment setup
- 📦 Isolated dependencies
- 🧰 Node.js 20 environment

## Prerequisites

- Docker
- Docker Compose

That's it! You don't need Node.js, npm, or any other tools installed locally.

## Quick Start

1. Clone this repository:
```bash
git clone <repository-url>
cd <project-directory>
```

2. Start the development environment:
```bash
chmod +x start.sh
./start.sh
```

This will:
- Create a new Vite React project (if it doesn't exist)
- Start the Docker container
- Install all dependencies
- Start the development server

Your application will be available at `http://localhost:5173`

## Development

### Project Structure

```
.
├── Dockerfile              # Development container configuration
├── Dockerfile.prod         # Production container configuration
├── compose.yaml           # Development Docker Compose configuration
├── compose.prod.yaml      # Production Docker Compose configuration
├── start.sh              # Development startup script
├── deploy.sh             # Production deployment script
├── nginx.conf            # Nginx configuration for production
└── src/                  # Your React application code
```

### Development Workflow

1. The development environment uses volume mounts, so any changes you make to your files will automatically trigger hot reload.

2. To install new dependencies:
```bash
docker compose exec vite_dev npm install <package-name>
```

3. To run other npm commands:
```bash
docker compose exec vite_dev npm <command>
```

### Stopping the Development Environment

```bash
docker compose down
```

## Production Deployment

1. Build and start the production container:
```bash
chmod +x deploy.sh
./deploy.sh
```

The production build will be served at `http://localhost:80`

### Production Features

- Multi-stage build for minimal image size
- Nginx server for static file serving
- Configured for React Router support
- Optimized static asset caching
- Automatic container restart

## Customization

### Environment Variables

1. Development:
- Create a `.env` file in your project root
- Variables must be prefixed with `VITE_` to be exposed to your React application

2. Production:
- Create a `.env.production` file
- Use the same `VITE_` prefix for variables

### Nginx Configuration

The production environment uses Nginx to serve your application. You can modify `nginx.conf` to:
- Add SSL configuration
- Customize caching behavior
- Configure redirects
- Add custom headers

### Docker Configuration

- Modify `Dockerfile` for development environment customization
- Modify `Dockerfile.prod` for production environment customization
- Adjust `compose.yaml` and `compose.prod.yaml` for container configuration

## Troubleshooting

### Common Issues

1. Port conflicts:
   - Change the port mapping in `compose.yaml` or `compose.prod.yaml`
   - Default ports are 5173 (dev) and 80 (prod)

2. Container not starting:
   - Check logs: `docker compose logs vite_dev`
   - Verify file permissions
   - Ensure ports are not in use

3. Hot reload not working:
   - Ensure your editor is saving files with correct line endings (LF)
   - Check if the volume mount is working correctly

### Getting Help

1. Check container logs:
```bash
docker compose logs
```

2. Access container shell:
```bash
docker compose exec vite_dev sh
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
