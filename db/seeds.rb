# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

def create_users

  User.create([{first_name: 'User1', email: 'em1@gmail.com', password: 'password'},
              {first_name:'User2', email: 'em2@gmail.com', password: 'password'}, 
              {first_name: 'User3', email: 'em3@gmail.com', password: 'password'}])

end

def create_projects

  Project.create([{name: 'Project1'}, {name: 'Project2'}, {name: 'Project3'}])

end

def create_project_members
  
  ProjectMember.create([{user_id: User.first.id, project_id: Project.first.id},
                        {user_id: User.second.id, project_id: Project.second.id},
                        {user_id: User.third.id, project_id: Project.third.id}])

end

def create_project_backlog

  ProductBacklog.create([{name: 'PB1', project_id: Project.first.id}, 
                         {name: 'PB2', project_id: Project.second.id}, 
                         {name: 'PB3', project_id: Project.third.id}])
  
end

def create_features

  Feature.create([{name: 'Feature1', product_backlog_id: ProductBacklog.first.id},
                  {name: 'Feature2', product_backlog_id: ProductBacklog.second.id},
                  {name: 'Feature3', product_backlog_id: ProductBacklog.third.id}])
  
end

def create_sprint_backlogs

  SprintBacklog.create([{name: 'SB1', product_backlog_id: ProductBacklog.first.id},
                        {name: 'SB2', product_backlog_id: ProductBacklog.second.id},
                        {name: 'SB3', product_backlog_id: ProductBacklog.third.id}])
  
end

def create_user_stories

  UserStory.create([{name: 'US1', feature_id: Feature.first.id},
                    {name: 'US2', feature_id: Feature.second.id},
                    {name: 'US3', feature_id: Feature.third.id}])
  
end


ActiveRecord::Base.transaction do
  create_users
  create_projects
  create_project_members
  create_project_backlog
  create_features
  create_sprint_backlogs
  create_user_stories  
  
end

