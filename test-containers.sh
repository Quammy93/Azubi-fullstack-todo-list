#!/bin/bash

# Check Frontend
echo "Testing Frontend (http://localhost:5173)..."
curl -s --head http://localhost:5173 | head -n 1

# Check Backend
echo "Testing Backend API (http://localhost:3000/todos)..."
curl -s http://localhost:3000/todos | jq

# Check MongoDB Container
echo "Testing MongoDB (inside container)..."
#docker exec -i $(docker ps -qf "name=mongo") mongo --eval "db.stats()" | grep "db"
docker exec -i azubi-fullstack-todo-list-mongo-1 mongo --eval "db.stats()" | grep "db"


echo "All tests complete."
