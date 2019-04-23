require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Questions
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
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end
end

def author
    User.find_by_id(author_id)
end

def replies
    Reply.find_by_question_id(id)
  end