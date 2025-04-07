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