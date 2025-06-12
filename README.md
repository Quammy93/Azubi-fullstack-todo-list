# 📝 Fullstack Todo List Application - Dockerized

This is a containerized fullstack Todo List app using React (Frontend), Node.js/Express (Backend), and MongoDB (Database). This guide includes setup, network/security notes, troubleshooting, and test scripts.

---

## 🚀 Setup Instructions

### ✅ Prerequisites

* [Docker Desktop](https://www.docker.com/products/docker-desktop)
* Git (optional for cloning the repo)

### 📦 Clone the Repository

```bash
git clone https://github.com/Quammy93/Azubi-fullstack-todo-list.git
cd Azubi-fullstack-todo-list
```

### 🛠 Directory Structure

```
.
├── backend/
│   ├── Dockerfile
│   ├── .env
├── frontend/
│   ├── Dockerfile
│   ├── .env
├── docker-compose.yml
```

### 🔧 Build and Start the Containers

```bash
docker compose up --build
```

This command builds all services and starts:

* Frontend at `http://localhost:5173`
* Backend at `http://localhost:3000`

### 🛑 Stop Containers

```bash
docker compose down
```

To remove volumes:

```bash
docker compose down -v
```

---

## 🔒 Network and Security Configurations

### 🔗 Network

Docker Compose creates a shared bridge network for service communication. Services refer to each other by container name.

### 🔐 Environment Variables

Backend `.env`:

```env
MONGO_URI=mongodb://mongo:27017/todos
```

* Not hardcoded; passed via `docker-compose.yml`

### 🌐 Exposed Ports

| Service  | Port Mapping  | Local URL                                      |
| -------- | ------------- | ---------------------------------------------- |
| Frontend | `5173:80`     | [http://localhost:5173](http://localhost:5173) |
| Backend  | `3000:3000`   | [http://localhost:3000](http://localhost:3000) |
| MongoDB  | Internal only | Used by backend                                |

---

## 🧰 Troubleshooting Guide

| Issue                          | Cause                            | Solution                                               |
| ------------------------------ | -------------------------------- | ------------------------------------------------------ |
| `ECONNREFUSED 127.0.0.1:27017` | Wrong DB host in backend         | Set `MONGO_URI=mongodb://mongo:27017/todos`            |
| `vite: command not found`      | Missing build step in Dockerfile | Ensure `npm install` and `npm run build` in Dockerfile |
| `Frontend not loading`         | App not built or running         | Rebuild with `docker compose up --build`               |
| `Port already in use`          | Conflict with host service       | Edit `docker-compose.yml` and map to different ports   |

---

## ✅ Container Testing Script

Create a script file `test-containers.sh`:

```bash
#!/bin/bash

# Test Frontend
echo "🧪 Testing Frontend (http://localhost:5173)..."
curl -s --head http://localhost:5173 | head -n 1

# Test Backend
echo "🧪 Testing Backend API (http://localhost:3000/todos)..."
curl -s http://localhost:3000/todos | jq

# Test MongoDB
echo "🧪 Testing MongoDB (inside container)..."
docker exec -i $(docker ps -qf "name=mongo") mongo --eval "db.stats()" | grep "db"

echo "✅ All tests complete."
```

Make executable:

```bash
chmod +x test-containers.sh
./test-containers.sh
```

---

## 📬 Submission Instructions

* Push all code and files (Dockerfiles, `docker-compose.yml`, `README.md`, scripts) to a public GitHub repository.
* Fill out the form provided by your interviewer with:

  * Your email address
  * Link to your public GitHub repo

✅ Make sure containers are running and app is accessible during your interview!

---

## 👩‍💻 Good luck and happy containerizing!
