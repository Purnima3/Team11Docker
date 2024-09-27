# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:3.9.20-alpine3.20

# Expose the port on which flask app runs 
EXPOSE 5000

# Install pip requirements
COPY requirements.txt .
RUN python -m pip install -r requirements.txt

WORKDIR /app
COPY . /app

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "test:app"]
