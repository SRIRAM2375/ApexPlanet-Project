from pathlib import Path
import pandas as pd
from sqlalchemy import create_engine


PROJECT_ROOT = Path(__file__).resolve().parent.parent

CSV_FILE = PROJECT_ROOT / "data" / "cleaned_superstore_sales.csv"
DB_FILE = PROJECT_ROOT / "data" / "superstore.db"


def get_engine():
    """Create and return the SQLite database engine."""
    database_url = f"sqlite:///{DB_FILE.as_posix()}"
    return create_engine(database_url)


def create_database():
    """Create SQLite database from cleaned CSV."""

    df = pd.read_csv(CSV_FILE)

    engine = get_engine()

    df.to_sql(
        "sales",
        engine,
        if_exists="replace",
        index=False
    )

    print("Database created successfully!")
    print("Rows inserted:", len(df))
    print("Columns:", len(df.columns))


def run_query(query):
    """Execute SQL query and return DataFrame."""

    engine = get_engine()

    with engine.connect() as connection:
        return pd.read_sql(query, connection)


if __name__ == "__main__":
    create_database()