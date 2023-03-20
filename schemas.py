from typing import List

from pydantic import BaseModel, EmailStr


class user_schemas(BaseModel):
    name: str
    email: str
    password: str
    phone: str

    class Config:
        orm_mode = True

class EmailSchema(BaseModel):
    email: List[EmailStr]
