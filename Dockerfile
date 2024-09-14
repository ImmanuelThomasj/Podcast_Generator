FROM python:3.12-slim

# Install necessary packages
RUN apt-get update && apt-get install -y \
    git \
    && apt-get clean

# Install PyYAML using pip
RUN pip install --upgrade pip \
    && pip install PyYAML

# Copy the necessary files
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
