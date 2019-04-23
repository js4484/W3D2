require 'sqlite3'

class Users
    attr_accessor :id, :fname, :lname
    def self.find_by_id(id)
    question = QuestionsDatabase.instance.execute(<<-SQL, id :id)
      SELECT
        users.*
      FROM
        users
      WHERE
        users.id = :id
    SQL
    return nil unless questions.length > 0

    User.new(user.first) 
  end

  def self.find_by_name(fname, lname)
    question = QuestionsDatabase.instance.execute(<<-SQL, attrs)
      SELECT
        users.*
      FROM
        users
      WHERE
        users.fname = :fname
        AND
        users.lname = :lname
    SQL
    return nil unless questions.length > 0

    User.new(user.first) 
  end


  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
    
  end
end

def authored_questions
    Question.find_by_author_id(id)
end
def authored_replies
    Reply.find_by_user_id(id)
end
