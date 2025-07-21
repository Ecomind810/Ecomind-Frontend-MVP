from fastapi import APIRouter
from pydantic import BaseModel
from services.coach_ai import get_ai_response

router = APIRouter()

class CoachInput(BaseModel):
    query: str
    context: dict

@router.post("/ask")
def chat_with_coach(data: CoachInput):
    response = get_ai_response(data.query, data.context)
    return {"response": response}