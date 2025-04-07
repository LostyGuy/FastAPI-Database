from pydantic import BaseModel

# Example of a Pydantic model

#class NameBase(BaseModel):
#     name: str
# class NameCreate(NameBase):
#     pass
# class Name(NameBase):
#     id: int
#     class Config:
#         from_attributes = True

class GamesBase(BaseModel):
    title: str
    developer: str
    publisher: str
    tag: str
    platform: str
    img_url: str

    class Config:
        from_attributes = True

class GamesResponse(GamesBase):
    game_id: int