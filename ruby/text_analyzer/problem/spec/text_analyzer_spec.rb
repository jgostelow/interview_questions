require 'spec_helper'
require_relative '../lib/text_analyzer'

describe TextAnalyzer do
    describe '::semantic_analysis' do
        it 'correctly identifies a positive text' do
            text= <<~END.gsub(/\n/, ' ').strip
                Jane Doe is the most wonderful teacher ever!  She really did a great job
                of preparing me for the CPA exam.  She did an awesome job, and you
                should definitely work with her.
            END
            expect(TextAnalyzer.semantic_analysis(text)).to eq('positive')
        end

        it 'correctly identifies a negative text' do
            text= <<~END.gsub(/\n/, ' ').strip
                This was a terrible experience.  At no point was John Doe helpful in the slightest.
                His lack of concern when I told him I got an F on my Math homework was appalling to say the least.
            END
            expect(TextAnalyzer.semantic_analysis(text)).to eq('negative')
        end

        it 'correctly identifies a neutral text' do
            text= <<~END.gsub(/\n/, ' ').strip
                Jane Doe was great at dealing with most of my accounting homework, but was horrible
                when we went over my econometrics worksheet.  She's a good teacher, but bad at
                helping with the more arcane parts of Economics.
            END
            expect(TextAnalyzer.semantic_analysis(text)).to eq('neutral')
        end
    end

    describe '::relevant_snippet' do
        it 'finds the correct snippet with 30 characters' do
            text= <<~END.gsub(/\n/, ' ').strip
                Micah is a really big help with all my math assignments.
                His mastery of math is really great, especially on difficult concepts like fractions.
            END
            actual = TextAnalyzer.relevant_snippet(text, 30, ['math', 'help'])
            expect(actual.length()).to be_within(10).of(30)
            expect(actual).to include('help with all my math')
        end

        it "doesn't break up sentences" do
            text= <<~END.gsub(/\n/, ' ').strip
                Micah is a really big help with all my math assignments.
                His mastery of math is really great, especially on difficult concepts like fractions.
            END
            actual = TextAnalyzer.relevant_snippet(text, 30, ['math', 'help'])
            parts = actual.split(/[[:space:]]/)
            expect(actual.length()).to be_within(10).of(30)
            expect(parts.count()).to be > 0
            expect(['Micah', 'is'].any? { |first_word| first_word == parts[0] }).to be(true)
        end
    end
end