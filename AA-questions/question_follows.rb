require 'sqlite3'

class QuestionFollows
    attr_accessor :id, :user_id, :question_id
    def self.find_by_id(id)
    questionf = QuestionFollows.instance.execute(<<-SQL, id :id)
      SELECT
        question_follows.*
      FROM
        question_follows
      WHERE
        question_follows.id = :id
    SQL
    return nil unless questionf.length > 0

    Questionf.new(questionf.first) 
  end

  def self.find_by_user_id(user_id)
    question = QuestionsDatabase.instance.execute(<<-SQL, attrs)
      SELECT
        question_follows.*
      FROM
        question_follows
      WHERE
        question_follows.user_id = :user_id
    
    SQL
    return nil unless questionf.length > 0

    Questionf.new(questionf.first) 
  end

  def self.find_by_question_id(question_id)
    question = QuestionsDatabase.instance.execute(<<-SQL, attrs)
      SELECT
        question_follows.*
      FROM
        question_follows
      WHERE
        question_follows.question_id = :question_id
    
    SQL
    return nil unless questionf.length > 0

    Questionf.new(questionf.first) 
  end

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
    
  end
end
