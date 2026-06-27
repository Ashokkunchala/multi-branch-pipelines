from fastapi import FastAPI
from fastapi.responses import JSONResponse

app = FastAPI(title="fastapi-python")

@app.get("/")
def home():
    return JSONResponse({"service": "fastapi-python", "status": "running"})

@app.get("/health")
def health():
    return JSONResponse({"status": "healthy"})
