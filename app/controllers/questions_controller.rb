class QuestionsController < ApplicationController

  def ask
  end

  def answer
    @userinput = params[:question]
    @userinput = params[:question].downcase
    work_phrases = [
      "i am going to work",
      "i'm going to work",
      "going to work",
      "heading to work",
      "off to work",
      "going to the office",
      "i'm going to the office"
    ]

    if work_phrases.include?(@userinput)
      possible_answers = ['great', 'awesome', 'fantastic', 'keep it up!']
      @answer = possible_answers.sample
    elsif @userinput.downcase == "what time is it?"
      @answer = Time.now.strftime("It's %R, it's a %A, the %d of %B %y")
    elsif @userinput.end_with?("?")
      @answer = 'Silly question, get dressed and go to work!'
    else
      @answer = "I don't care, get dressed and go to work!"
    end
  end

end
