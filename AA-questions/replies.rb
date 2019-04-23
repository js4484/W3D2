require 'sqlite3'

class Replies
    attr_accessor :id, :author_id, :question_id, :parent_reply_id
    def self.find_by_id(id)
    reply = Replies.instance.execute(<<-SQL, id :id)
      SELECT
        replies.*
      FROM
        replies
      WHERE
        replies.id = :id
    SQL
    return nil unless reply.length > 0

    Reply.new(reply.first) 
  end

  def self.find_by_author_id(author_id)
    question = Replies.instance.execute(<<-SQL, attrs)
      SELECT
        replies.*
      FROM
        replies
      WHERE
        replies.author_id = :author_id
    
    SQL
    return nil unless reply.length > 0

    Reply.new(reply.first) 
  end

  def self.find_by_question_id(question_id)
    question = Replies.instance.execute(<<-SQL, attrs)
      SELECT
        replies.*
      FROM
        replies
      WHERE
        replies.question_id = :question_id
    
    SQL
    return nil unless reply.length > 0

    Reply.new(reply.first) 
  end

  def initialize(options)
    @id = options['id']
    @author_id = options['author_id']
    @question_id = options['question_id']
    @parent_reply_id = options['parent_reply_id']
    @body = options['body']
    
  end
end


def question
    Question.find(question_id)
end

def parent_reply
    Replies.find(parent_reply_id)
end

def child_replies
    Replies.find_by_parent_id(id)
end