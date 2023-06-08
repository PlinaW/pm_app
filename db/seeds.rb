def create_users
  User.create!([{ first_name: 'Wojciech', last_name: 'Wojciechowski',
                  email: 'wojciech@example.com', password: 'abcdefgh' },
                { first_name:'Martyna', last_name: 'Martynowska',
                  email: 'martyna@example.com', password: 'zxyuvwabc' }, 
                { first_name: 'Grzegorz', last_name: 'Grzegorzewski',
                  email: 'grzegorz@example.com', password: 'abc123abc' }])             
end

def create_projects
  Project.create([{ name: 'Jak zarobić a się nie narobić', description: 'Aplikacja służąca do zarządzania projektami',
                    status: 'pending', start_date: Date.today, end_date: Date.today + 6.months }, 
                  { name: 'Gdybym miał 4 ręce i 2 busy', description: 'Aplikacja dla kurierów',
                    status: 'pending', start_date: Date.today - 2.months, end_date: Date.today + 20.days }])
end

def create_epics  
  Epic.create([{ name: 'Funkcjonalność rejestracji nowych użytkowników', 
                 description: 'Użytkownik ma mieć możliwość stworzenia swojego konta, które będzie zawierało dane użytkownika i umożliwiało mu korzystanie z aplikacji.', 
                 priority: 1, context: 'feature', status: 'pending', project: Project.first },
               { name: 'Funkcjonalnoścć logowania użytkowników', description: 'Użytkownik ma mieć możlwiość zalogowania do konta', 
                 priority: 2, context: 'feature', status: 'pending', project: Project.first },
               { name: 'Możliwość przeglądania i edytowania konta użytkownika', description: 'Użytkownik ma mieć możlwiość przeglądania oraz edytowania konta', 
                 priority: 3, context: 'feature', status: 'pending', project: Project.first },
               { name: 'Funkcjonalność tworzenia zleceń dla kurierów', description: 'Użytkownik ma mieć możlwiość przypisania zlecenia kurierowi z wolnymi przebiegami', 
                 priority: 1, context: 'feature', status: 'pending', project: Project.second }])
end

def create_user_stories
  UserStory.create([{ name: 'Tworzenie konta użytkownika', 
                      description: 'Jako użytkownik chcę mieć możliwość założenia własnego konta za pomocą formularza, następnie ma zostac sprawdzona poprawność wprowadzonych danych',
                      status: 'To do', priority: 1, epic: Epic.first },
                    { name: 'Potwierdzenie rejestracji przez e-mail', 
                      description: 'Chcę aby konta użytkowników były potwierdzane za pośrednictwem e-maila',
                      status: 'To do', priority: 2, epic: Epic.first },
                    { name: 'Zarządzanie danymi użykownika', 
                      description: 'Jako użytkownik chcę mieć dostęp do swoich danych, aby móc je przeglądać oraz edytować',
                      status: 'To do', priority: 3, epic: Epic.third },
                    { name: 'Wyszukiwanie wolnych kurierów', 
                      description: 'Jako użytkownik, chce mieć możlwość wyszukania wolnych kurierów, aby móc przypisać im nowe zadania',
                      status: 'To do', priority: 1, epic: Epic.fourth }])
end

def create_sprints
  Sprint.create([{ name: "Umożliwienie dostępu do apki", goal: "Zakładania kont im się zachciało...",
                   start_date: Date.today, end_date: Date.today + 6.days },
                 { name: "Szukajka obijających się kierowców", goal: "Trzeba dać jakąś robotę tym nierobom...",
                   start_date: Date.today, end_date: Date.today + 4.days }])
end

def create_tasks
  Task.create([ #Project: Project.first, UserStory: UserStory.first, Sprint: Sprint.first
               { user_story: UserStory.first, sprint: Sprint.first, user: User.first, name: "Background dla funkcjonalności",
                 description: nil, status: "To do", priority: 1, starts_at: Date.today, ends_at: Date.today + 2.days },
               { user_story: UserStory.first, sprint: Sprint.first, user: User.first, name: "Utworzenie formularza rejestracji",
                 description: nil, status: "To do", priority: 2, starts_at: Date.today + 2, ends_at: Date.today + 4.days },
               { user_story: UserStory.first, sprint: Sprint.first, user: User.first, name: "Walidacja wprowadzonych danych w formularzu",
                 description: nil, status: "To do", priority: 3, starts_at: Date.today + 4.days, ends_at: Date.today + 6.days },
                #Project: Project.first, UserStory: UserStory.second, Sprint: Sprint.first
               { user_story: UserStory.second, sprint: Sprint.first, user: User.second, name: "Wysłanie wiadomości e-mail z linkiem potwierdzającym",
                 description: nil, status: "To do", priority: 1, starts_at: Date.today, ends_at: Date.today + 2.days },
               { user_story: UserStory.second, sprint: Sprint.first, user: User.second, name: "Implementacja mechanizmu weryfikacji potwierdzenia rejestracji",
                 description: nil, status: "To do", priority: 2, starts_at: Date.today + 2.days, ends_at: Date.today + 4.days },
                #Project: Project.first, UserStory: UserStory.third, Sprint: Sprint.first
               { user_story: UserStory.third, sprint: Sprint.first, user: User.third, name: "Implementacja systemu logowania użytkownika",
                 description: nil, status: "To do", priority: 1, starts_at: Date.today, ends_at: Date.today + 2.days },               
               { user_story: UserStory.third, sprint: Sprint.first, user: User.third, name: "Stworzenie panelu do wyświetlania profilu użytkownika",
                 description: nil, status: "To do", priority: 2, starts_at: Date.today + 2.days, ends_at: Date.today + 4.days },
               { user_story: UserStory.third, sprint: Sprint.first, user: User.third, name: "Implementacja mechanizmu zarządzania danymi konta z poziomu panelu",
                 description: nil, status: "To do", priority: 3, starts_at: Date.today + 4.days, ends_at: Date.today + 6.days },
                #Project: Project.second, UserStory: UserStory.fourth, Sprint: Sprint.second
               { user_story: UserStory.fourth, sprint: Sprint.second, user: User.first, name: "Implementacja mechanizmu wyszukiwania kurierów",
                 description: nil, status: "To do", priority: 1, starts_at: Date.today, ends_at: Date.today + 2.days },               
               { user_story: UserStory.fourth, sprint: Sprint.second, user: User.first, name: "Implementacja mechanizmu przypisania zlecenia dla kuriera",
                 description: nil, status: "To do", priority: 2, starts_at: Date.today + 2.days, ends_at: Date.today + 4.days }])
end


ActiveRecord::Base.transaction do
  create_users
  create_projects
  create_epics
  create_user_stories  
  create_sprints
  create_tasks
end