require 'sqlite3'

class QuestionLikes
    attr_accessor :id, :user_id, :question_id
    def self.find_by_id(id)
    questionl = QuestionLikes.instance.execute(<<-SQL, id :id)
      SELECT
        question_likes.*
      FROM
        question_likes
      WHERE
        question_likes.id = :id
    SQL
    return nil unless questionl.length > 0

    QuestionLike.new(questionl.first) 
  end

  def self.find_by_user_id(user_id)
    question = QuestionLikes.instance.execute(<<-SQL, attrs)
      SELECT
        question_likes.*
      FROM
        question_likes
      WHERE
        question_likes.user_id = :user_id
    
    SQL
    return nil unless questionl.length > 0

    QuestionLike.new(questionl.first) 
  end

  def self.find_by_question_id(question_id)
    question = QuestionLikes.instance.execute(<<-SQL, attrs)
      SELECT
        question_likes.*
      FROM
        question_likes
      WHERE
        question_likes.question_id = :question_id
    
    SQL
    return nil unless questionl.length > 0

    QuestionLike.new(questionl.first) 
  end

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
    
    
  end
end


