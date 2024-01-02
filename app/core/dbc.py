from sqlalchemy import MetaData
from databases import Database
from .config import CONFIG

try:
    db = Database(CONFIG.DATABASE_URL)
except DatabaseError as e:
    raise ValueError(f'Error connecting to the database: {e}')  # Customized error message with details
except Exception as e:
    raise ValueError(f'Unexpected error: {e}')  # Catching any unexpected exceptions
metadata = MetaData()

