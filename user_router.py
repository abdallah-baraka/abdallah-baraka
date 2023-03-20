import fastapi_mail
from fastapi import *
from random import randint
from fastapi_mail import ConnectionConfig, MessageSchema, MessageType
from fastapi_mail.email_utils import DefaultChecker
from sqlalchemy.orm import sessionmaker,Session
from starlette.responses import JSONResponse
from model import user_model
from schemas import user_schemas, EmailSchema
from database import sessionlocal, engine,get_db
from sqlalchemy import or_,and_
from werkzeug.security import  generate_password_hash


user_router=APIRouter(
    prefix="/user",
    tags=["User"]
)


@user_router.get("/")
def get_data():
    return  {"msg":"Hello"}

@user_router.post("/signup",status_code=status.HTTP_201_CREATED)
async def signup(request:user_schemas , db:Session=Depends(get_db)):
    db_email=db.query(user_model).filter(or_(request.email==user_model.email,request.phone==user_model.phone)).first()
    if db_email is not None:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST,detail="this user is already exist")
    else:
        user=user_model(
            name=request.name,
            password=generate_password_hash(request.password),
            email=request.email,
            phone=request.phone,
            v_code=randint(10000,99999)
        )
        db.add(user)
        db.commit()





@user_router.post("/send_email")
async def send_email(email: EmailSchema,mail_server):
    conf = ConnectionConfig(
        MAIL_USERNAME="abdallahbaraka",
        MAIL_PASSWORD="abdallahbaraka@20",
        MAIL_FROM="Atyourservice@email.com",
        MAIL_PORT=465,
        MAIL_SERVER=mail_server,
        MAIL_STARTTLS=False,
        MAIL_SSL_TLS=True,
        USE_CREDENTIALS=True,
        VALIDATE_CERTS=True
    )
    html = """
    <p>Thanks for using Fastapi-mail</p> 
    """
    message = MessageSchema(
        subject="Fastapi-Mail module",
        recipients=email.dict().get("email"),
        body=html,
        subtype=MessageType.html)
    fm=fastapi_mail(conf)
    await fm.send_message(message)
    return JSONResponse(status_code=200, content={"message": "email has been sent"})



async def default_checker():
    checker = DefaultChecker()  # you can pass source argument for your own email domains
    await checker.fetch_temp_email_domains() # require to fetch temporary email domains
    return checker


@user_router.get('/email/blocked/domains')
async def get_blocked_domain(
    domain: str = Query(...),
    checker: DefaultChecker = Depends(default_checker)
    ) -> JSONResponse:

    res = await checker.is_blocked_domain(domain)

    return JSONResponse(status_code=200, content={"result": res})