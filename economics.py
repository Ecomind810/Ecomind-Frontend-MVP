def calculate_roi(cost: float, savings: float, years: int = 5) -> float:
    try:
        return round((savings * years - cost) / cost * 100, 2)
    except ZeroDivisionError:
        return 0.0

def evaluate_economic_shift(current: float, new: float) -> dict:
    monthly_savings = round(current - new, 2)
    yearly_savings = monthly_savings * 12
    roi = calculate_roi(new, monthly_savings)
    return {
        "monthly_savings": monthly_savings,
        "yearly_savings": yearly_savings,
        "roi_percent": roi
    }