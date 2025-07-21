import os
from dotenv import load_dotenv
import openai

load_dotenv()
openai.api_key = os.getenv("OPENAI_API_KEY")

def generate_prompt(user_query: str, context: dict) -> str:
    return f"""
You are a sustainability and economics coach. The user lives in {context.get("location")} and follows this lifestyle: 
Transport: {context["habits"]["transport_mode"]}, 
Energy: {context["habits"]["energy_source"]}, 
Diet: {context["habits"]["diet_type"]}.

User asks: {user_query}
Give a friendly, insightful answer to help them improve sustainability and understand financial impact.
"""

def get_ai_response(user_query: str, context: dict) -> str:
    prompt = generate_prompt(user_query, context)
    response = openai.ChatCompletion.create(
        model="gpt-4",
        messages=[{"role": "user", "content": prompt}],
        max_tokens=300
    )
    return response['choices'][0]['message']['content']