from sqlalchemy import Column, Integer, String
from app.database import Base

# Exanmple of a model class

# class Name(Base):
#     __tablename__ = "name"
#     id = Column(Integer, primary_key=True, index=True)

class Games(Base):
    __tablename__ = 'games'
    game_id = Column(Integer, primary_key=True, index=True)
    title = Column(String, index=True)
    developer = Column(String, index=True)
    publisher = Column(String, index=True)
    tag = Column(String, index=True)
    platform = Column(String, index=True)
    img_url = Column(String, index=True)
    
class Users(Base):
    __tablename__ = 'users'
    user_id = Column(Integer, primary_key=True, index=True)
    login = Column(String, unique=True, index=True)
    hashed_password = Column(String, index=True)
    username = Column(String, index=True)
    
    # def __str__(self):
    #     return f"User: {self.username} (Login: {self.login}) (Password: {self.hashed_password})"
    
class Session(Base):
    __tablename__ = 'session'
    session_id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer, index=True)
    token = Column(String, index=True)
    created_at = Column(String, index=True)
    expiration_date = Column(String, index=True)