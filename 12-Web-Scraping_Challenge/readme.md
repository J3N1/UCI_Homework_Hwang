# Web Scraping Homework - Mission to Mars
## Background
### Step 1 - Scraping
+ Used the Jupyter Notebook file [mission to mars](https://github.com/J3N1/UCI_Homework_Hwang/blob/master/12-Web-Scraping_Challenge/Missions_to_Mars/mission_to_mars.ipynb) to scrape information on:<br>
  - The Latest Mars News Title and Paragraph Text from the NASA Mars News Site<br>
  - The JPL Featured Space Image on the JPL Mars website<br>
  - The table containing facts about Mars from the space facts website<br>
  - The high resolution images for each of Mar's hemispheres from the USGS Astrogeology website<br>
### Step 2 - MongoDB and Flask Application
+ Used the following files to create a new HTML page that displays all of the information that was scraped from step 1: <br>
  - [Scrape Mars](https://github.com/J3N1/UCI_Homework_Hwang/blob/master/12-Web-Scraping_Challenge/Missions_to_Mars/scrape_mars.py): python script that executed all of the scraping code
  - [index.html](https://github.com/J3N1/UCI_Homework_Hwang/blob/master/12-Web-Scraping_Challenge/Missions_to_Mars/templates/index.html): template HTML file that takes the mars data dictionary and displays all of the data in the appropriate HTML elements.
  - [app.py](https://github.com/J3N1/UCI_Homework_Hwang/blob/master/12-Web-Scraping_Challenge/Missions_to_Mars/app.py): Flask file that was associated with the html file to create the new HTML page with all of the scrapped Mars information
  - [HTML Screenshot](https://github.com/J3N1/UCI_Homework_Hwang/blob/master/12-Web-Scraping_Challenge/Missions_to_Mars/HTML_Screenshot.pdf): screenshot of the new HTML page that displays the Mars information