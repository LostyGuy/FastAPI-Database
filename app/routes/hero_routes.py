from fastapi import APIRouter

router = APIRouter()

@router.get("/heroes")
def get_heroes():
    return {"message": "List of heroes"}
