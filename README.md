
# Factorio Map Share

Allows users to upload/download saves for the game Factorio.  Uploaded zip files will automatically extract the save games preview .png for display on the uploads page.

---
### Tech Used
- Rails
- Devise
- Paperclip
- RubyZip

---
### Approach
- Sketched out ERD and Wireframe.
- I first began building an app similar to scribble.
- After I got the basic models and controllers built for maps and comments I began working with paperclip for file uploads.
- Once paperclip was integrated I needed to figure out how to extract the map's image from the uploaded file.
- I used rubyzip for file extraction and worked to get the extracted file to display on the sites views.
- I then decided to work on the users, and wanted to try out devise.  I'm glad I did, it was quick and easy to get basic user functionality working.
- Finally I add some styling.

---
### Installation
Either goto: [Heroku link](http://factorio-map-share.herokuapp.com/factorio_maps)
Or clone this repo.
- run rake db:drop db:create db:migrate db:seed
- run rails s
- In your browser of choice goto: [localhost:3000](localhost:3000)

---
### Unsolved Problems
DEPLOYMENT: Heroku will delete extracted images after an hour or so.  Since extraction is only handled on creation of a new map, previously uploaded save cannot display their images.

DEVELOPMENT:
- There's many bugs because uploaded files aren't validated in any way.
- User features need to be expanded.  Users can delete other user's posts, maps, etc...
- Better styling needed... Just look at it.
- Much of these issues came down to time constraints.  I already have plans for fixes.
