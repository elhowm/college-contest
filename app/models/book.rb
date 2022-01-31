class Book
  attr_accessor :id,
                :subject,
                :text

  def initialize(id, subject, text)
    @id = id
    @subject = subject
    @text = text
  end
end
