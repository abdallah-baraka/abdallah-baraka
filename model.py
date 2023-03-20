from database import base
from sqlalchemy import Column, String,Integer,BOOLEAN,ForeignKey,SmallInteger,Text



class user_model(base):
    __tablename__="users"
    id=Column(Integer,primary_key=True,index=True,autoincrement=True)
    name=Column(String(100),nullable=True)
    email=Column(String(100),unique=True,nullable=True)
    password=Column(Text,nullable=True)
    phone=Column(Integer,unique=True,nullable=True)
    v_code=Column(SmallInteger)
    # image_url=Column(Text)