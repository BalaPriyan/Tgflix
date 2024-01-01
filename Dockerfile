# Use Python 3.8.6 base image
FROM python:3.8.6

# Set working directory
WORKDIR /app

# Copy the application code to the container
COPY . /app

# Install system dependencies
RUN apt-get update && \
    apt-get install -y postgresql-client

# Create and activate virtual environment
RUN pip3 install virtualenv && \
    virtualenv venv && \
    . venv/bin/activate

# Install Python dependencies
RUN pip3 install -r requirements.txt

# Set environment variables
ENV DATABASE_URL="postgres://zfzqdbzb:ZDT6m8lXKDuWKNhIRkvxRmE3ifBeT_4Z@flora.db.elephantsql.com/zfzqdbzb"

# Setup Database
RUN psql $DATABASE_URL < scripts/migrate.sh

# Expose the port your app runs on
EXPOSE 8000

# Command to run the app
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
