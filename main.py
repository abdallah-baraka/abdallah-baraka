from fastapi import *

from database import base, engine
from model import user_model
from user_router import user_router


base.metadata.create_all(bind=engine)
app=FastAPI()
app.include_router(user_router)

