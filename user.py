from pydantic import BaseModel, Field
from typing import Optional, List

class HabitData(BaseModel):
    transport_mode: str
    weekly_km: float
    energy_source: str
    monthly_kwh: float
    diet_type: str
    shopping_expense: float

class EconomicData(BaseModel):
    current_costs: float
    target_savings_goal: Optional[float] = 0.0

class UserProfile(BaseModel):
    user_id: str
    location: str
    habits: HabitData
    economics: EconomicData
    goals: List[str] = Field(default_factory=list)