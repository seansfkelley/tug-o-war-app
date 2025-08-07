from typing import Union
from fastapi import FastAPI
from uuid import UUID

app = FastAPI()

@app.post("/register/{uuid}")
def register(uuid: UUID):
  return { "success": True, "uuid": uuid }
