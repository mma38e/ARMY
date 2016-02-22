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
bin/rails generate controller student

#create event controller
bin/rails generate controller events

#move all controllers to locations
mv -f ../files/controllers app/

#move all models
mv -f ../files/models app/

#move all views
mv -f ../files/views app/

#move all routes
mv -f ../files/routes.rb config/

#run the server
bin/rails server
