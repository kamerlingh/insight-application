##Data Demo For Insight Data Science
####Kristen Sunter
#####April 15, 2015

In this demo, I share some data gathered by my labmates and me on niobium nitride films deposited on different substrates. These films were then used to fabricate nanoscale devices to detect very low levels of light. The performance of the detectors depends on their thickness, so we need to know the thickness to select the films to use for fabrication. 

Many groups use the deposition time as a proxy for the thickness: the longer the niobium nitride is deposited, the thicker it is. However, these method can't be used to detect differences in the thickness of films that are deposited in the same run but at different positions within the deposition chamber, or films that are deposited for the same amount of time but on different days when the conditions might have changed. I built a transmissometer that can measure the thickness of the films using the transmittance of light through them, and this demo shows that the measured thickness predicts the sheet resistance, a value that correlates with thickness, better than the deposition time.

This repo has three R scripts. `loading_sample_data.R` loads our measurement data from an .xlsx file and cleans it. `exploratory_plots.R` plots the data and shows the motivation for using the measured thickness instead of the deposition time to describe our films. `linear_regression.R` performs linear regressions on the data, plots the results and creates a PNG file with the plots that include the R<sup>2</sup> values.