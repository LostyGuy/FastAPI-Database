from sqlalchemy import Column, Integer, String, ForeignKey
from sqlalchemy.orm import relationship
from app.database import Base

# Define the Tag model
class Tag(Base):
    __tablename__ = "tags"

    id = Column(Integer, primary_key=True, index=True)
    tag_name = Column(String, index=True)

    # Define a relationship to the TagsGames model
    tag_games = relationship("TagsGames", back_populates="tag")

# Define the Platform model
class Platform(Base):
    __tablename__ = "platforms"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String, index=True)
    version = Column(String, index=True)
    company_owner = Column(String, index=True)

    # Define a relationship to the PlatformsGames model
    platform_games = relationship("PlatformsGames", back_populates="platform")

# Define the Game model
class Game(Base):
    __tablename__ = "games"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String, index=True)
    description = Column(String, index=True)
    developer = Column(String, index=True)
    publisher = Column(String, index=True)

    # Define relationships to the TagsGames and PlatformsGames models
    game_tags = relationship("TagsGames", back_populates="game")
    game_platforms = relationship("PlatformsGames", back_populates="game")

# Define the TagsGames model
class TagsGames(Base):
    __tablename__ = "tags_games"

    id = Column(Integer, primary_key=True, index=True)
    tag_id = Column(Integer, ForeignKey('tags.id'), index=True)
    game_id = Column(Integer, ForeignKey('games.id'), index=True)

    # Define relationships to the Tag and Game models
    tag = relationship("Tag", back_populates="tag_games")
    game = relationship("Game", back_populates="game_tags")

# Define the PlatformsGames model
class PlatformsGames(Base):
    __tablename__ = "platforms_games"

    id = Column(Integer, primary_key=True, index=True)
    platform_id = Column(Integer, ForeignKey('platforms.id'), index=True)
    game_id = Column(Integer, ForeignKey('games.id'), index=True)

    # Define relationships to the Platform and Game models
    platform = relationship("Platform", back_populates="platform_games")
    game = relationship("Game", back_populates="game_platforms")