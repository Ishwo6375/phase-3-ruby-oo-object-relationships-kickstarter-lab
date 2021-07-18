class Project
    attr_accessor :title
    @@all = []

    def initialize(title)
        @title = title
        self.class.all << self
    end

    def self.all
        @@all
    end

    def add_backer(backer)
        ProjectBacker.new(self, backer)
    end

    def backers
        project_backers = ProjectBacker.all.select do |project_backer|
            project_backer.project == self
        end
        project_backers.map do |project_backer|
            project_backer.backer
        end
    end
end