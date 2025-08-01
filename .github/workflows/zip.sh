#!/bin/bash

#Zip directory
MODEL_DIR="model"
ZIP_FILE="model.zip"

# Check if the model directory exists
   if [ -d "$MODEL_DIR" ]; then
        echo "Directory exists."
    else
        echo "Directory does not exist."
    fi
# Install zip if not installed
if ! command -v zip &> /dev/null; then
    echo "zip command not found, installing..."
    sudo apt-get update
    sudo apt-get install -y zip
fi

# Create a zip file of the model directory
if [ -d "$MODEL_DIR" ]; then
    echo "Zipping the model directory..."
    zip -r "$ZIP_FILE" "$MODEL_DIR"
    echo "Model directory zipped successfully to $ZIP_FILE"
else
    echo "Model directory does not exist, skipping zipping."
fi
# Check if the zip file was created successfully
if [ -f "$ZIP_FILE" ]; then
    echo "Zip file created successfully: $ZIP_FILE"
else
    echo "Failed to create zip file."
fi
# Clean up the zip file if needed
# Uncomment the next line if you want to remove the zip file after zipping
