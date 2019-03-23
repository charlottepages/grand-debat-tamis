require 'csv'

namespace :import do
  task data: :environment do
    puts '---------- DESTROYING QUESTIONS'
    Question.destroy_all

    # puts '---------- PARSING CSV'
    # demo = "#{Dir.pwd}/db/data/questions_demo.csv"
    # fisca = "#{Dir.pwd}/db/data/questions_fisca.csv"
    # orga = "#{Dir.pwd}/db/data/questions_orga.csv"
    # transition = "#{Dir.pwd}/db/data/questions_transition.csv"

    # puts '---------- CREATING QUESTIONS'
    # puts '-------------- Démocratie et citoyenneté'
    # CSV.foreach(demo) do |row|
    #   question = Question.find_or_create_by!(grand_debat_id: row[0])
    #   question.title = row[1]
    #   question.theme = 'Démocratie et citoyenneté'
    #   question.save!
    # end

    # puts '-------------- Fiscalité et dépenses publiques'
    # CSV.foreach(fisca) do |row|
    #   question = Question.find_or_create_by!(grand_debat_id: row[0])
    #   question.title = row[1]
    #   question.theme = 'Fiscalité et dépenses publiques'
    #   question.save!
    # end

    # puts "-------------- Organisation de l'État et des services publics"
    # CSV.foreach(orga) do |row|
    #   question = Question.find_or_create_by!(grand_debat_id: row[0])
    #   question.title = row[1]
    #   question.theme = "Organisation de l'État et des services publics"
    #   question.save!
    # end

    # puts '-------------- Transition écologique'
    # CSV.foreach(transition) do |row|
    #   question = Question.find_or_create_by!(grand_debat_id: row[0])
    #   question.title = row[1]
    #   question.theme = 'Transition écologique'
    #   question.save!
    # end

    puts '---------- CREATING QUESTIONS'

    themes = [nil, 'Démocratie et citoyenneté', 'Fiscalité et dépenses publiques', 'Transition écologique', "Organisation de l'État et des services publics"]

    filepath = "#{Dir.pwd}/db/data/question_index_to_label.json"
    serialized_questions = File.read(filepath)
    questions = JSON.parse(serialized_questions)
    questions.each do |key, value|
      qu = Question.create(grand_debat_id: key, title: value[0], theme: themes[value[1]])
    end

    puts '---------- DESTROYING ANSWERS'
    Answer.destroy_all

    puts '---------- PARSING JSON'
    filepath = "#{Dir.pwd}/db/data/idees_marquantes.json"
    serialized_ideas = File.read(filepath)
    ideas = JSON.parse(serialized_ideas, symbolize_names: true)

    puts '---------- CREATING ANSWERS'
    ideas.each do |idea|
      answer = Answer.new(
        content: idea.fetch(:reponse)[0, 2000],
        zipcode: idea.fetch(:authorZipCode),
        source: idea.fetch(:source),
        contributor_type: idea.fetch(:authorType),
        published_at: idea.fetch(:publishedAt),
        flag_count: idea.fetch(:"0")
      )

      question_index = idea.fetch(:questionIndex)
      the_question = Question.find_or_create_by!(grand_debat_id: question_index)
      answer.question = the_question
      answer.save!

      tags = idea.fetch(:Categories)
      tags. each do |tag|
        the_tag = Tag.find_or_create_by!(name: tag)
        AnswerTag.create!(tag: the_tag, answer: answer)
      end
    end
    puts '---------- ALL DONE'
  end
end
