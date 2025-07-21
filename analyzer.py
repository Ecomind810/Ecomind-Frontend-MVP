from fastapi import APIRouter
from pydantic import BaseModel
from services.economics import evaluate_economic_shift

router = APIRouter()

class CostInput(BaseModel):
    current: float
    new: float

@router.post("/analyze")
def analyze_economics(data: CostInput):
    return evaluate_economic_shift(data.current, data.new)