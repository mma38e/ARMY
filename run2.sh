
#removes previous run if there is one

rm -rf ARMY/

#creates basic app

rails new ARMY
cd ARMY


#create Student form and table(scaffold)

bin/rails generate scaffold student firstName:string lastName:string email:string studentId:string

#migrate scaffold into database
bin/rake db:migrate

#Create events
bin/rails generate scaffold events eventName:string eventLocation:string eventDate:date eventTime:time eventInfo:text

#migrate scaffold into database
bin/rake db:migrate

#Create player controller
bin/rails generate controller welcome "homepage"

#move views
cp -f ../Files/homepage.html.erb app/views/welcome/

#move all routes
cp -f ../Files/routes.rb config/ config/

#remove files folder
rm -rf ../Files/

#run the server
bin/rails server
