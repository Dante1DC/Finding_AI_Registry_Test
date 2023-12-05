# Finding AI Registry Test
This is a project for RAIK270H, that aids in collecting data. 

# Specification


# Structure
Uses Ruby on Rails for web application framework, SQLite3 for it's database, and Bootstrap for styling. This used to be hosted on Heroku, but the use case wasn't there anymore. As a result, the PostgreSQL stuff isn't in modern implementations of the app.
## Flow
When you begin your first browser session with this tool, you're assigned a user_id, which is a unique identifier that follows you through refreshes. This cookie let's us associate your data with a Google Form linked in the application. The Google Form just tracks demographic information, and auto-fills with your cookie. 
## Controllers
### Application
Assigns a random cookie to your browser session. 
### Home
Displays home page, two images, and two multiple choice questions. Answering then and clicking "Submit Response" will add a new row to Response, a database that stores the user's ID, the question number, the two images that they were shown, the one they preferenced, the one they thought was AI Art, and a boolean indicating whether or not they were correct. 

# Debug Instructions
## Running Server
`rails server` 
## Verifying data is recorded
All response data is stored in "Response.db". You can use the ruby console to verify whether or not data is collected. 
`rails console`

`Response.all`

This will show you all responses recorded, ever. If you want just responses for a given user, you'll have to do the following:

`Response.find(USERID)`

User IDs are cookies that are logged per browser session. 

# Analysis
This GitHub also includes a folder called "Analysis" where you can analyze responses data. It uses Python's pandas to do so. You'll need Jupyter Notebook to use those files. Currently, there's no function to convert the mysqlite3 db to a csv, so the only analysis done in that document is for the Google Form responses. Further instructions are provided in the "analysis.ipynb" document.
# Future Development
## TODO: Add bulk image downloader
https://github.com/felipeam86/imagedownloader
## TODO: Create sql -> csv function