class Backer
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        self.class.all << self
    end

    def self.all
        @@all
    end

    def back_project(project)
        ProjectBacker.new(project, self)
    end

    def backed_projects
        project_backers = ProjectBacker.all.select do |project_backer|
            project_backer.backer == self
        end
        project_backers.map do |project_backer|
            project_backer.project
        end
    end
end