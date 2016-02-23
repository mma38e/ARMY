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

#move all routes
#mv -f ../files/routes.rb config/

#add to homepage to routes
sed '10 a root welcome#homepage' config/routes.rb

#run the server
bin/rails server
