#creates basic app

mkdir ARMY
cd ARMY
rails new team
cd team
bin/rails server

#create Student form and table(scaffold)

bin/rails generate scaffold Student firstName:string lastName:string email:string studentId:string

#migrate scaffold into database
bin/rake db:migrate

#Create events
bin/rails generate scaffold events eventName:string eventLocation:string eventDate:date eventTime:time eventInfo:text

#migrate scaffold into database
bin/rake db:migrate