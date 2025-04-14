from fastapi import FastAPI, Request, Depends, Response
from fastapi.templating import Jinja2Templates
from fastapi.staticfiles import StaticFiles
from fastapi.responses import HTMLResponse
from sqlalchemy.orm import Session
from app import schemas, models, database
import base64
import random as rand
import string as st

app = FastAPI()

# Create database tables
models.Base.metadata.create_all(bind=database.engine)

# Dependency to get the database session
def get_db():
    db = database.SessionLocal()
    try:
        yield db
    finally:
        db.close()

# Root endpoint
@app.get("/", response_class=HTMLResponse)
async def root(request: Request):
    return templates.TemplateResponse(
        "main_page.html", {"request": request})

# Mount static files
app.mount("/static", StaticFiles(directory="app/static"), name="static")

# Set up templates
templates = Jinja2Templates(directory="templates")

# Endpoint to view games
@app.get("/games_view/{id}", response_class=HTMLResponse)
async def read_games_list(request: Request, id: int, db: Session = Depends(get_db)):
    games_list = db.query(models.Games).all()
    return templates.TemplateResponse(
        "games_view.html", {"request": request, "id": id, "games_list": games_list}
    )

@app.get("/game_details/{id}", response_class=HTMLResponse)
async def read_games(request: Request, id: int, db: Session = Depends(get_db)):
    game = db.query(models.Games).filter(models.Games.game_id == id).first()
    if not game:
        return templates.TemplateResponse(
            "game_details.html", {"request": request, "error": "Game not found"}
        )
    return templates.TemplateResponse(
        "game_details.html", {"request": request, "game": game}
    )

# Endpoint to register users
@app.get("/register", response_class=HTMLResponse)
async def register_site(request: Request):
    return templates.TemplateResponse("register.html", {"request": request})

@app.post("/register", response_class=HTMLResponse)
async def register_user(request: Request, db: Session = Depends(get_db)):
    
    form = await request.form()
    login = form.get("login")
    password = base64.b64encode((form.get("password")).encode())
    username = form.get("username")
        
    existing_user = db.query(models.Users).filter(models.Users.login == login).first()
    if existing_user:
        return templates.TemplateResponse(
            "register.html",
            {"request": request, "error": "Login already exists. Please choose another."},
        )
    
    new_user = models.Users(
        login=login,
        hashed_password=password,
        username=username
    )

    db.add(new_user)
    db.commit()
    db.close()
    
    return templates.TemplateResponse(
        "register.html", {"request": request, "success": "User registered successfully"}
    )
    
@app.get("/login", response_class=HTMLResponse)
async def login_site(request: Request):
    return templates.TemplateResponse("login.html", {"request": request})
    
@app.post("/login", response_class=HTMLResponse)
async def login_site(request: Request, response: Response, db: Session = Depends(get_db)):
    
    form = await request.form()
    in_login = form.get("login")
    in_password = base64.b64encode(form.get("password").encode()).decode()
    
    if not in_login or not in_password:
        return templates.TemplateResponse(
            "login.html", {"request": request, "error": "Login and password are required"}
        )
    elif db.query(models.Users).filter(models.Users.login == in_login).first():
        user = db.query(models.Users).filter(models.Users.login == in_login).first()
        db_login = user.login
        db_password = user.hashed_password
        if db_login != in_login or db_password != in_password:
            return templates.TemplateResponse(
            "login.html", {"request": request, "error": "Invalid login or password", }
            )
        return templates.TemplateResponse(
            "login.html", {"request": request, "success": "User logged successfully"}
        )
    session_key = "".join(rand.choices(st.ascii_letters + st.digits, k=32))
    # Create a session and set a cookie
    response.set_cookie(key=db.query(models.Session.token).filter(models.Session.user_id == u_id), value=session_key)
    new_session = models.Session(
        user_id=user.user_id,
        token=session_key
        )
    
    db.add(new_session)
    db.commit()
    db.close()

    return templates.TemplateResponse("login.html", {"request": request, "success": "User logged successfully"}) 