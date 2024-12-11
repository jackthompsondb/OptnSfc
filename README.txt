# README

Note: 
This repo is a work-in-progress.
Upcoming, I will be working on comparing the current empirical analysis with a couple of well-known theoretical models.
The current set of expiration dates allows for a really good comparison analysis.

This repository contains several Jupyter Notebooks for analyzing and visualizing options data. Below is a brief description of each notebook and relevant references to MATLAB scripts and directories:

***
All data is from the Center of Research in Security Prices (CRSP)
https://wrds-www.wharton.upenn.edu/pages/get-data/center-research-security-prices-crsp/
***

The default ticker analyzed is the ^VIX ETF.

Due to the nature of the data, there seems to be only significant demand for OTM Call options.
While there is demand for puts, it is only for a small amount in proportion to the entire dataset.
Therefore, the visual analysis done in `greeks.ipynb` and `visualise.ipynb` is only representative of OTM Calls.
However, the data calculated is still present for ITM/OTM Call & Puts in the .csv files.

Raw data file: `UnderlyingOptionsIntervals_1800sec_2021-04-26.csv`

## dataclean.ipynb

The `dataclean.ipynb` notebook is responsible for cleaning and preprocessing the options data. It performs the following tasks:
- Reads raw options data from the raw data file.
- Filters and sorts the data based on specific criteria.
- Saves selected & filtered data to the `/data` directory.
- Converts data types as necessary.
- Calculates implied volatility for each option using the Black-Scholes model.
- Saves the implied volatility data for further analysis in the `/implied` directory.

Relevant MATLAB scripts:
- `jaeckel.m`: Used for specific calculations and data processing tasks within the notebook, including optimized root finding using Jaeckel's method (2006).
- `newtonraphson.m`: A less efficient but self-made NR iterative root finder, not optimally calibrated.

## impliedvisual.ipynb

The `impliedvisual.ipynb` notebook is used for visualizing the options data. It includes various plots and charts to help understand the data better. Key visualizations include:
- Volatility smiles overplotted at each 30-minute interval of the day.
- Volatility smiles plotted for different taus (expirations).
- 3D surface scatter plots of the implied volatility surface.

## greeks.ipynb

The `greeks.ipynb` notebook calculates the Greeks for options, which are essential for understanding the sensitivity of options prices to various factors. It includes the following calculations for each tau (expiration date):
- Delta: Measures the sensitivity of the option's price to changes in the price of the underlying asset.
- Gamma: Measures the rate of change of delta with respect to changes in the underlying price.
- Vega: Measures the sensitivity of the option's price to changes in the volatility of the underlying asset.
- Theta: Measures the sensitivity of the option's price to the passage of time (time decay).
- Rho: Measures the sensitivity of the option's price to changes in the risk-free interest rate.

## Initialize Datasets
To initialize, please run the following notebooks in order:
1. `dataclean.ipynb`
2. `impliedvisual.ipynb`
3. `greeks.ipynb`

Then you may run and tweak them individually as you like.
