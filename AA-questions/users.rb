require 'sqlite3'

class Users
    attr_accessor :id, :title, :body, :author_id
    def self.find_by_id(id)
    question = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        questions.*
      FROM
        questions
      WHERE
        id = :id
    SQL
    return nil unless questions.length > 0

    Question.new(question.first) 
  end

  def self.find_by_author_id(author_id)
    question = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        questions.*
      FROM
        questions
      WHERE
        author_id = :author_id
    SQL
    return nil unless questions.length > 0

    Question.new(question.first) 
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
    
  end
end

