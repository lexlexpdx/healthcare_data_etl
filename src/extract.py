# ------------------------------------------------------------------------------
# File: extract.py
# Author: Lex Albrandt
# Purpose: This file serves as the extraction script for the healthcare dataset
# ------------------------------------------------------------------------------

# Imports
import pandas as pd


# Functions
def extract_data(filepath: str) -> pd.DataFrame:
    """ Function to extract csv file using provided filepath

    Args:
        filepath (string): Filepath for csv file

    Returns:
        dataframe: dataframe extracted from csv filepath
    """
    df = pd.read_csv(filepath)
    return df

# Main
if __name__ == "__main__":

    health_df = extract_data("../data/healthcare_dataset.csv")

    # Dataset info
    print(f"Dataset name: Healthcare Dataset")
    print(f"Rows: {len(health_df)}")
    print(f"Columns: {len(health_df.columns)}")
    print(f"\nColumn Names: ")
    print(health_df.columns.to_list())

    print(f"\nData Preview:")
    print(health_df.head())

    print(f"\nDataset Info:")
    print(health_df.info())