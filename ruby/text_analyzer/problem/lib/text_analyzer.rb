require 'set'

module TextAnalyzer
    POSITIVE_WORDS = Set.new([
        'nice',
        'good',
        'great',
        'wonderful',
        'excellent',
        'awesome',
    ])

    NEGATIVE_WORDS = Set.new([
        'terrible',
        'bad',
        'horrible',
        'appalling',
    ])

    # Given a piece of text, classify it as positive, negative, or neutral.
    #
    # == Parameters:
    # text::
    #   A String containing some text to be classified.
    #
    # == Returns:
    #   'positive', 'negative', or 'neutral'
    #
    def self.semantic_analysis(text)
        'positive'
    end

    # Given a piece of text, return the best substring of about num_chars (doesn't have to be exactly num_chars).  The best substring will be the one with the most relevant words in it.
    #
    # == Parameters:
    # text::
    #   A String containing some text to be searched.
    # num_chars::
    #   A Fixnum indicating how many characters we should try to get.
    # relevant_words::
    #   An Array<String> containing the words that determine whether the text is relevant.
    #
    # == Returns:
    #   A String containing the most relevant part of the text.
    #
    def self.relevant_snippet(text, num_chars, relevant_words)
        text
    end
end