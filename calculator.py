from fastapi import APIRouter
from models.user import HabitData
from services.footprint import calculate_total_emission

router = APIRouter()

@router.post("/estimate")
def estimate_footprint(habits: HabitData):
    total = calculate_total_emission(habits.dict())
    return {"carbon_footprint_kg": total}