# Use the official Python 3.9 image as the base image
FROM python:3.11-slim

# Copy the requirements file into the container and install dependencies
COPY src/ app/
COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt

# Set the working directory to /app
WORKDIR /app

# Expose port 8501 for external access
EXPOSE 8501

HEALTHCHECK CMD curl --fail http://localhost:8501/_stcore/health

ENTRYPOINT ["streamlit", "run", "/app/streamlit-app.py", "--server.port=8501", "--server.address=0.0.0.0"]