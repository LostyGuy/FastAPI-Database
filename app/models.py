from sqlmodel import Field, SQLModel

# Hero model (table)
class Hero(SQLModel, table=True):
    id: int | None = Field(default=None, primary_key=True)
    name: str
    age: int | None = Field(default=None)
    secret_name: str
