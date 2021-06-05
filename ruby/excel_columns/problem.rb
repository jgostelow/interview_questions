require 'rspec'

module Excel
    def self.alphabetize(column)
    end
end

describe Excel do
    describe '::alphabetize' do
        it 'returns correct output' do
            cases = {
                0 => 'A',
                1 => 'B',
                2 => 'C',
                25 => 'Z',
                26 => 'AA',
                27 => 'AB',
                28 => 'AC',
                51 => 'AZ',
                52 => 'BA',
                53 => 'BB',
                54 => 'BC',
                77 => 'BZ',
                676 => 'ZA',
                677 => 'ZB',
                678 => 'ZC',
                701 => 'ZZ',
                702 => 'AAA',
                703 => 'AAB',
                704 => 'AAC',
                727 => 'AAZ',
                728 => 'ABA',
                729 => 'ABB',
                730 => 'ABC'
            }

            expect(cases.map { |column, _| Excel.alphabetize(column) }).to eq(cases.values)
        end
    end
end