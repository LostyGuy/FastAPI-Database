from sqlmodel import create_engine, Session, SQLModel

# SQLite Database URL
DATABASE_URL = "sqlite:///./database.db"

# Create engine
engine = create_engine(DATABASE_URL, connect_args={"check_same_thread": False})

# Dependency to get a database session
def get_session():
    with Session(engine) as session:
        yield session

# Function to initialize the database
def create_db_and_tables():
    SQLModel.metadata.create_all(engine)
