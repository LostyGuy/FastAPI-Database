from fastapi import FastAPI, Depends, HTTPException
from sqlalchemy.orm import Session
from app import models, schemas, database
from app.custom_json_encoder import PrettyJSONResponse

app = FastAPI(default_response_class=PrettyJSONResponse)

# Create the database tables
models.Base.metadata.create_all(bind=database.engine)

# Dependency to get a database session
def get_db():
    db = database.SessionLocal()
    try:
        yield db
    finally:
        db.close()

@app.get("/")
def read_root():
    return {"Hello": "World"}

# CRUD operations for Tag model
@app.post("/tags/", response_model=schemas.Tag)
def create_tag(tag: schemas.TagCreate, db: Session = Depends(get_db)):
    db_tag = models.Tag(tag_name=tag.tag_name)
    db.add(db_tag)
    db.commit()
    db.refresh(db_tag)
    return db_tag

@app.get("/tags/", response_model=list[schemas.Tag])
def read_tags(skip: int = 0, limit: int = 10, db: Session = Depends(get_db)):
    tags = db.query(models.Tag).offset(skip).limit(limit).all()
    return tags

@app.get("/tags/{tag_id}", response_model=schemas.Tag)
def read_tag(tag_id: int, db: Session = Depends(get_db)):
    tag = db.query(models.Tag).filter(models.Tag.id == tag_id).first()
    if tag is None:
        raise HTTPException(status_code=404, detail="Tag not found")
    return tag

@app.put("/tags/{tag_id}", response_model=schemas.Tag)
def update_tag(tag_id: int, tag: schemas.TagCreate, db: Session = Depends(get_db)):
    db_tag = db.query(models.Tag).filter(models.Tag.id == tag_id).first()
    if db_tag is None:
        raise HTTPException(status_code=404, detail="Tag not found")
    db_tag.tag_name = tag.tag_name
    db.commit()
    db.refresh(db_tag)
    return db_tag

@app.delete("/tags/{tag_id}", response_model=schemas.Tag)
def delete_tag(tag_id: int, db: Session = Depends(get_db)):
    db_tag = db.query(models.Tag).filter(models.Tag.id == tag_id).first()
    if db_tag is None:
        raise HTTPException(status_code=404, detail="Tag not found")
    db.delete(db_tag)
    db.commit()
    return db_tag

# CRUD operations for Platform model
@app.post("/platforms/", response_model=schemas.Platform)
def create_platform(platform: schemas.PlatformCreate, db: Session = Depends(get_db)):
    db_platform = models.Platform(name=platform.name, version=platform.version, company_owner=platform.company_owner)
    db.add(db_platform)
    db.commit()
    db.refresh(db_platform)
    return db_platform

@app.get("/platforms/", response_model=list[schemas.Platform])
def read_platforms(skip: int = 0, limit: int = 10, db: Session = Depends(get_db)):
    platforms = db.query(models.Platform).offset(skip).limit(limit).all()
    return platforms

@app.get("/platforms/{platform_id}", response_model=schemas.Platform)
def read_platform(platform_id: int, db: Session = Depends(get_db)):
    platform = db.query(models.Platform).filter(models.Platform.id == platform_id).first()
    if platform is None:
        raise HTTPException(status_code=404, detail="Platform not found")
    return platform

@app.put("/platforms/{platform_id}", response_model=schemas.Platform)
def update_platform(platform_id: int, platform: schemas.PlatformCreate, db: Session = Depends(get_db)):
    db_platform = db.query(models.Platform).filter(models.Platform.id == platform_id).first()
    if db_platform is None:
        raise HTTPException(status_code=404, detail="Platform not found")
    db_platform.name = platform.name
    db_platform.version = platform.version
    db_platform.company_owner = platform.company_owner
    db.commit()
    db.refresh(db_platform)
    return db_platform

@app.delete("/platforms/{platform_id}", response_model=schemas.Platform)
def delete_platform(platform_id: int, db: Session = Depends(get_db)):
    db_platform = db.query(models.Platform).filter(models.Platform.id == platform_id).first()
    if db_platform is None:
        raise HTTPException(status_code=404, detail="Platform not found")
    db.delete(db_platform)
    db.commit()
    return db_platform

# CRUD operations for Game model
@app.post("/games/", response_model=schemas.Game)
def create_game(game: schemas.GameCreate, db: Session = Depends(get_db)):
    db_game = models.Game(name=game.name, description=game.description, developer=game.developer, publisher=game.publisher)
    db.add(db_game)
    db.commit()
    db.refresh(db_game)
    return db_game

@app.get("/games/", response_model=list[schemas.Game])
def read_games(skip: int = 0, limit: int = 10, db: Session = Depends(get_db)):
    games = db.query(models.Game).offset(skip).limit(limit).all()
    return games

@app.get("/games/{game_id}", response_model=schemas.Game)
def read_game(game_id: int, db: Session = Depends(get_db)):
    game = db.query(models.Game).filter(models.Game.id == game_id).first()
    if game is None:
        raise HTTPException(status_code=404, detail="Game not found")
    return game

@app.put("/games/{game_id}", response_model=schemas.Game)
def update_game(game_id: int, game: schemas.GameCreate, db: Session = Depends(get_db)):
    db_game = db.query(models.Game).filter(models.Game.id == game_id).first()
    if db_game is None:
        raise HTTPException(status_code=404, detail="Game not found")
    db_game.name = game.name
    db_game.description = game.description
    db_game.developer = game.developer
    db_game.publisher = game.publisher
    db.commit()
    db.refresh(db_game)
    return db_game

@app.delete("/games/{game_id}", response_model=schemas.Game)
def delete_game(game_id: int, db: Session = Depends(get_db)):
    db_game = db.query(models.Game).filter(models.Game.id == game_id).first()
    if db_game is None:
        raise HTTPException(status_code=404, detail="Game not found")
    db.delete(db_game)
    db.commit()
    return db_game

# CRUD operations for TagsGames model
@app.post("/tags_games/", response_model=schemas.TagsGames)
def create_tags_games(tags_games: schemas.TagsGamesCreate, db: Session = Depends(get_db)):
    db_tags_games = models.TagsGames(tag_id=tags_games.tag_id, game_id=tags_games.game_id)
    db.add(db_tags_games)
    db.commit()
    db.refresh(db_tags_games)
    return db_tags_games

@app.get("/tags_games/", response_model=list[schemas.TagsGames])
def read_tags_games(skip: int = 0, limit: int = 10, db: Session = Depends(get_db)):
    tags_games = db.query(models.TagsGames).offset(skip).limit(limit).all()
    return tags_games

@app.get("/tags_games/{tags_games_id}", response_model=schemas.TagsGames)
def read_tags_games(tags_games_id: int, db: Session = Depends(get_db)):
    tags_games = db.query(models.TagsGames).filter(models.TagsGames.id == tags_games_id).first()
    if tags_games is None:
        raise HTTPException(status_code=404, detail="TagsGames not found")
    return tags_games

@app.put("/tags_games/{tags_games_id}", response_model=schemas.TagsGames)
def update_tags_games(tags_games_id: int, tags_games: schemas.TagsGamesCreate, db: Session = Depends(get_db)):
    db_tags_games = db.query(models.TagsGames).filter(models.TagsGames.id == tags_games_id).first()
    if db_tags_games is None:
        raise HTTPException(status_code=404, detail="TagsGames not found")
    db_tags_games.tag_id = tags_games.tag_id
    db_tags_games.game_id = tags_games.game_id
    db.commit()
    db.refresh(db_tags_games)
    return db_tags_games

@app.delete("/tags_games/{tags_games_id}", response_model=schemas.TagsGames)
def delete_tags_games(tags_games_id: int, db: Session = Depends(get_db)):
    db_tags_games = db.query(models.TagsGames).filter(models.TagsGames.id == tags_games_id).first()
    if db_tags_games is None:
        raise HTTPException(status_code=404, detail="TagsGames not found")
    db.delete(db_tags_games)
    db.commit()
    return db_tags_games

# CRUD operations for PlatformsGames model
@app.post("/platforms_games/", response_model=schemas.PlatformsGames)
def create_platforms_games(platforms_games: schemas.PlatformsGamesCreate, db: Session = Depends(get_db)):
    db_platforms_games = models.PlatformsGames(platform_id=platforms_games.platform_id, game_id=platforms_games.game_id)
    db.add(db_platforms_games)
    db.commit()
    db.refresh(db_platforms_games)
    return db_platforms_games

@app.get("/platforms_games/", response_model=list[schemas.PlatformsGames])
def read_platforms_games(skip: int = 0, limit: int = 10, db: Session = Depends(get_db)):
    platforms_games = db.query(models.PlatformsGames).offset(skip).limit(limit).all()
    return platforms_games

@app.get("/platforms_games/{platforms_games_id}", response_model=schemas.PlatformsGames)
def read_platforms_games(platforms_games_id: int, db: Session = Depends(get_db)):
    platforms_games = db.query(models.PlatformsGames).filter(models.PlatformsGames.id == platforms_games_id).first()
    if platforms_games is None:
        raise HTTPException(status_code=404, detail="PlatformsGames not found")
    return platforms_games

@app.put("/platforms_games/{platforms_games_id}", response_model=schemas.PlatformsGames)
def update_platforms_games(platforms_games_id: int, platforms_games: schemas.PlatformsGamesCreate, db: Session = Depends(get_db)):
    db_platforms_games = db.query(models.PlatformsGames).filter(models.PlatformsGames.id == platforms_games_id).first()
    if db_platforms_games is None:
        raise HTTPException(status_code=404, detail="PlatformsGames not found")
    db_platforms_games.platform_id = platforms_games.platform_id
    db_platforms_games.game_id = platforms_games.game_id
    db.commit()
    db.refresh(db_platforms_games)
    return db_platforms_games

@app.delete("/platforms_games/{platforms_games_id}", response_model=schemas.PlatformsGames)
def delete_platforms_games(platforms_games_id: int, db: Session = Depends(get_db)):
    db_platforms_games = db.query(models.PlatformsGames).filter(models.PlatformsGames.id == platforms_games_id).first()
    if db_platforms_games is None:
        raise HTTPException(status_code=404, detail="PlatformsGames not found")
    db.delete(db_platforms_games)
    db.commit()
    return db_platforms_games