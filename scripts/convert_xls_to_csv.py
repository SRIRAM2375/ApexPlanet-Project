import pandas as pd

input_file = "E:\\APEX-Task1\\data\\sample_-_superstore.xls"
output_file = "E:\\APEX-Task1\\data\\superstore_sales.csv"

df = pd.read_excel(input_file)

df.to_csv(output_file, index=False)

print("Conversion completed successfully!")
print("Rows:", df.shape[0])
print("Columns:", df.shape[1])