import streamlit as st
import pandas as pd
from pathlib import Path

# Set the title of the Streamlit web application
st.title('Streamlit Test App')

# Add a header to display text
st.header('Sample data head')

# Read the 'iris.csv' dataset using pandas, assuming it's located in the 'static' folder
iris = pd.read_csv(Path(__file__).parent / 'static/iris.csv')

# Display the first few rows of the dataset as a table
st.dataframe(iris.head())

# Add another header to display text
st.header('Sample data chart')

# Create a scatter plot chart using 'sepal_length' on the x-axis, 'sepal_width' on the y-axis,
# and color the data points based on the 'species' column from the dataset
st.scatter_chart(
    iris,
    x='sepal_length',
    y='sepal_width',
    color='species'
)
