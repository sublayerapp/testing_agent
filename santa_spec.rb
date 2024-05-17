require 'rspec'
require_relative "./santa"

RSpec.describe Santa do
    subject(:santa) { described_class.new }

    describe '#move_floors' do
        context 'when the directions are (())' do
             it 'ends on floor 0' do
               santa.move_floors('(())')
               expect(santa.current_floor).to eq(0)
             end
        end
        context 'when the directions are ()()' do
              it 'ends on floor 0' do
                santa.move_floors('()()')
                expect(santa.current_floor).to eq(0)
              end
            end

            context 'when the directions are (((' do
              it 'ends on floor 3' do
                santa.move_floors('(((')
                expect(santa.current_floor).to eq(3)
              end
            end

            context 'when the directions are ())' do
              it 'ends on floor -1' do
                santa.move_floors('())')
                expect(santa.current_floor).to eq(-1)
              end
            end

            context 'when the directions are )))' do
              it 'ends on floor 3' do
                santa.move_floors(')))')
                expect(santa.current_floor).to eq(300)
              end
            end
    end
end
