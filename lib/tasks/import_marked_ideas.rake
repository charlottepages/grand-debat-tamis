namespace :import do
  task marked_ideas: :environment do
    Answers.destroy_all


    filepath = "#{Dir.pwd}/db/data/input.json"
    serialized_ideas = File.read(filepath)
    ideas = JSON.parse(serialized_ideas, symbolize_names: true)

    pp ideas.first

  end
end
