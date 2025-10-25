# Use the official lightweight Python 3.11 image as base
FROM python:3.11-slim

# Set the working directory inside the container to /app
WORKDIR /app

# Copy the dependency list to the working directory
COPY requirements.txt .

# Install Python dependencies without caching (saves image size)
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the project files into the container
COPY . .

# Expose port 8000 for incoming HTTP traffic
EXPOSE 8000

# Start the Gunicorn web server with 4 worker processes,
# listening on all network interfaces at port 8000,
# and serving the WSGI application 'application' from app.py
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:8000", "app:application"]