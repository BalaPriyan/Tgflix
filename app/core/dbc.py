from sqlalchemy import MetaData
from databases import Database
from .config import CONFIG

try:
    db = Database(CONFIG.DATABASE_URL)
    metadata = MetaData()
except Exception as e:
    raise RuntimeError('Invalid or missing database URL') from e

