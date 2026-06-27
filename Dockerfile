FROM python:3.8-slim\nWORKDIR /app\nCOPY . /app\nRUN pip install flask\nEXPOSE 5000\nCMD ["python", "src/app.py"]
