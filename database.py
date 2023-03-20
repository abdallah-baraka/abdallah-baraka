from sqlalchemy import *
from sqlalchemy.ext.declarative import declarative_base
from  sqlalchemy.orm import sessionmaker
engine=create_engine("mysql://4276136_4276136:abdallah_service2023@fdb1029.awardspace.net/4276136_4276136")

base=declarative_base()
sessionlocal=sessionmaker(bind=engine)


def get_db():
    db=sessionlocal()
    try:
        yield db
    finally:
        db.close()
