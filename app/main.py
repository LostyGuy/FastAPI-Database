from fastapi import FastAPI
from app.database import create_db_and_tables
from app.routes.hero_routes import router

# FastAPI instance
app = FastAPI()

# Include hero-related routes
app.include_router(router, prefix="/api", tags=["heroes"])

# Startup event to create database tables
@app.on_event("startup")
def on_startup():
    create_db_and_tables()
