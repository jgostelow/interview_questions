require 'json'
require 'sinatra/base'
require_relative '../text_analyzer'

module TextAnalyzer
    class App < Sinatra::Application
        post('/text') do
            content_type(:json)

            # Parse the body as JSON, and validate that the required parameters exist.
            # TODO: Verify that the parameters have the correct type.
            parsed = JSON.parse(request.body.read())
            missing = ['text', 'num_chars', 'relevant_words'].reject { |key| parsed[key] }
            if missing.count > 0
                return [400, {}, JSON.generate({"errors": missing.map { |key| "Must supply a \"#{key}\" parameter" }.join("\n")})]
            end

            # Perform semantic analysis of the text, and pick out the most relevant substring with about the given number of characters.
            semantic_analysis = TextAnalyzer.semantic_analysis(parsed['text'])
            relevant_snippet = TextAnalyzer.relevant_snippet(parsed['text'], parsed['num_chars'], parsed['relevant_words'])

            JSON.generate({
                'semantic_analysis': semantic_analysis,
                'relevant_snippet': relevant_snippet,
            })
        end
    end
end