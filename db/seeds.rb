# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


def create_users

  User.create!([{first_name: 'Wojciech', email: 'wojciech@example.com', password: 'password'},
                {first_name:'Martyna', email: 'martyna@example.com', password: 'password'}, 
                {first_name: 'Grzegorz', email: 'grzegorz@example.com', password: 'password'}])
                  
end

def create_projects

  Project.create([{name: 'PM_APP', description: 'Aplikacja służąca do zarządzania projektów', status: 'W realizacji', started_at: Date.today, ended_at: '1 September 2023'}, 
                  {name: 'POST_APP', description: 'Aplikacja dla kurierów', status: 'W realizacji', started_at: Date.today, ended_at: '1 September 2023'}])

end

def create_epics
  
  Epic.create([{name: 'Funkcjonalnoścć rejestracji użytkowników', description: 'Użytkownik ma mieć możlwiość założenia konta', 
                   type: 'Epic', priority: 5, comment: 'Ogarnąłem właśnie, że będę chyba potrzebować stworzyć model na komentarze xd',
                   created_by: User.find_by(first_name: 'Wojciech'), project: Project.first},
                  {name: 'Funkcjonalnoścć logowania użytkowników', description: 'Użytkownik ma mieć możlwiość zalogowania do konta', 
                   type: 'Epic', priority: 5, comment: 'Ogarnąłem właśnie, że będę chyba potrzebować stworzyć model na komentarze xd',
                   created_by: User.find_by(first_name: 'Wojciech'), project: Project.first},
                  {name: 'Funkcjonalnoścć rejestracji użytkowników', description: 'Użytkownik ma mieć możlwiość założenia konta', 
                   type: 'Epic', priority: 5, comment: 'Ogarnąłem właśnie, że będę chyba potrzebować stworzyć model na komentarze xd',
                   created_by: User.find_by(first_name: 'Wojciech'), project: Project.second},
                  {name: 'Funkcjonalnoścć logowania użytkowników', description: 'Użytkownik ma mieć możlwiość zalogowania do konta', 
                   type: 'Epic', priority: 5, comment: 'Ogarnąłem właśnie, że będę chyba potrzebować stworzyć model na komentarze xd',
                   created_by: User.find_by(first_name: 'Wojciech'), project: Project.second}])
end

def create_user_stories

  UserStory.create([{name: 'Jako nowy użytkownik chcę mieć możlwiość założenia konta', description: 'Trzeba wprowadzić devise by móc założyć konto użytkownikowi',
                     status: 'Do zrobienia', priority: 5, comment: 'Tutaj tak samo potrzebny jest model komentarzy, ale chyba jeden model wystarczy', created_by: User.first,
                     epic: Epic.first},
                     {name: 'Jako nowy użytkownik chce mieć możliwość rejestracji za pomocą formularza', description: 'Trzeba stworzyć widok z formularzem do rejestracji',
                     status: 'Do zrobienia', priority: 5, comment: 'Tutaj tak samo potrzebny jest model komentarzy, ale chyba jeden model wystarczy', created_by: User.first,
                     epic: Epic.first},
                     {name: 'Jako nowy użytkownik chcę mieć możlwiość założenia konta', description: 'Trzeba wprowadzić devise by móc założyć konto użytkownikowi',
                     status: 'Do zrobienia', priority: 5, comment: 'Tutaj tak samo potrzebny jest model komentarzy, ale chyba jeden model wystarczy', created_by: User.second,
                     epic: Epic.second},
                     {name: 'Jako nowy użytkownik chce mieć możliwość rejestracji za pomocą formularza', description: 'Trzeba stworzyć widok z formularzem do rejestracji',
                     status: 'Do zrobienia', priority: 5, comment: 'Tutaj tak samo potrzebny jest model komentarzy, ale chyba jeden model wystarczy', created_by: User.second,
                     epic: Epic.second},])
  
end

def create_sprints

  Sprint.create([{name: 'Przygotowanie dostępu dla użytkownika do korzystania z aplikacji', goal: 'Użytkownik musi mieć możliwość wejścia do apki',
                  created_by: User.first, started_at: Date.today, ended_at: '6 June 2023'},
                 {name: 'Przygotowanie dostępu dla użytkownika do korzystania z aplikacji', goal: 'Użytkownik musi mieć możliwość wejścia do apki',
                  created_by: User.second, started_at: Date.today, ended_at: '6 June 2023'}])
  
end

def create_tasks

  Task.create([{name: UserStory.first.name, description: UserStory.first.description, status: UserStory.first.status, priority: UserStory.first.priority, comment: UserStory.first.comment,
                created_by: UserStory.first.created_by, owner: User.first, started_at: Date.today, ended_at: Date.tomorrow, user_story: UserStory.first, sprint: Sprint.first,
                user: User.first},
                {name: UserStory.second.name, description: UserStory.second.description, status: UserStory.second.status, priority: UserStory.second.priority, comment: UserStory.second.comment,
                created_by: UserStory.second.created_by, owner: User.second, started_at: Date.today, ended_at: Date.tomorrow, user_story: UserStory.second, sprint: Sprint.first,
                user: User.second}])
  
end


ActiveRecord::Base.transaction do

  create_users
  create_projects
  create_epics
  create_user_stories  
  create_sprints
  create_tasks

end
