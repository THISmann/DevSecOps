# Use official Python image
FROM python:3-alpine

# Set working directory
WORKDIR /app

# Copy dependance       
COPY requirements.txt /app/requirements.txt

# Install dependencies
RUN pip install -r requirements.txt

#Copy application file
COPY app.py /app/app.py

# Expose the application port
EXPOSE 5000

# Start the application
CMD ["python", "app.py"]
