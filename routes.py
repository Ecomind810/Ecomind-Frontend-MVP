from fastapi import APIRouter
from api.carbon import calculator
from api.economic import analyzer
from api.coach import chat

router = APIRouter()
router.include_router(calculator.router, prefix="/carbon", tags=["Carbon Footprint"])
router.include_router(analyzer.router, prefix="/economic", tags=["Economic Impact"])
router.include_router(chat.router, prefix="/coach", tags=["AI Coach"])