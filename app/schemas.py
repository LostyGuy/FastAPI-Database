from pydantic import BaseModel


class TagBase(BaseModel):
    tag_name: str

class TagCreate(TagBase):
    pass

class Tag(TagBase):
    id: int
    class Config:
        from_attributes = True

class PlatformBase(BaseModel):
    name: str
    version: str
    company_owner: str

class PlatformCreate(PlatformBase):
    pass

class Platform(PlatformBase):
    id: int
    class Config:
        from_attributes = True

class GameBase(BaseModel):
    name: str
    description: str
    developer: str
    publisher: str

class GameCreate(GameBase):
    pass

class Game(GameBase):
    id: int
    class Config:
        from_attributes = True

class TagsGamesBase(BaseModel):
    tag_id:int
    game_id:int

class TagsGamesCreate(TagsGamesBase):
    pass

class TagsGames(TagsGamesBase):
    id:int
    class Config:
        from_attributes = True

class PlatformsGamesBase(BaseModel):
    platform_id:int
    game_id:int

class PlatformsGamesCreate(PlatformsGamesBase):
    pass

class  PlatformsGames(PlatformsGamesBase):
    id:int
    class Config:
        from_attributes = True