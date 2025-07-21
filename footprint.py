def transport_emission(mode: str, km: float) -> float:
    factors = {"car": 0.21, "bus": 0.09, "train": 0.05, "bike": 0.0, "walk": 0.0}
    return factors.get(mode.lower(), 0.2) * km

def energy_emission(source: str, kwh: float) -> float:
    factors = {"coal": 0.9, "natural_gas": 0.5, "solar": 0.05, "wind": 0.02}
    return factors.get(source.lower(), 0.5) * kwh

def diet_emission(diet_type: str) -> float:
    base = {"vegan": 0.3, "vegetarian": 0.5, "omnivore": 1.5}
    return base.get(diet_type.lower(), 1.5)

def calculate_total_emission(habits: dict) -> float:
    transport = transport_emission(habits["transport_mode"], habits["weekly_km"]) * 4
    energy = energy_emission(habits["energy_source"], habits["monthly_kwh"])
    food = diet_emission(habits["diet_type"])
    shopping = habits["shopping_expense"] * 0.1
    return round(transport + energy + food + shopping, 2)