# Use the official Python 3.11-slim image as the base image
FROM python:3.11-slim

# Copy the source code from the src/ directory into the container's /app/ directory
COPY src/ /app/

# Copy the requirements.txt file into the container's /app/ directory
COPY requirements.txt /app/requirements.txt

# Install the Python dependencies listed in requirements.txt without using cache
RUN pip install --no-cache-dir -r /app/requirements.txt

# Set the working directory to /app
WORKDIR /app

# Expose port 8501 for external access
EXPOSE 8501

# Define a health check command to ensure the Streamlit app is healthy
HEALTHCHECK CMD curl --fail http://localhost:8501/_stcore/health

# Specify the entry point command to run the Streamlit app
ENTRYPOINT ["streamlit", "run", "/app/streamlit-app.py", "--server.port=8501", "--server.address=0.0.0.0"]